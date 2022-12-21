import 'dart:async' show Timer;

import 'package:flame/collisions.dart';
import 'package:flame/components.dart' hide Timer;
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/services.dart';

import '../../attack_strategy/attack_strategy.dart';
import '../../bosses/bosses.dart';
import '../../map_maker/map_maker.dart';
import '../../my_game.dart';
import 'keyboard_listener.dart';
import 'actions_observer.dart';

class Player extends SpriteAnimationComponent
    with KeyboardHandler, CollisionCallbacks {
  late final MyKeyboardListener _keyboardListener;
  // ignore: unused_field
  late final ActionsObserver _movementObserver;

  late final MyGame _game;

  bool _vulnerable = true;
  bool inCombat = false;
  late AttackStrategy attackStrategy;

  bool canWalk = false;
  late double moveSpeed = 135.0;
  Vector2 _movement = Vector2.zero();
  Vector2 _velocity = Vector2.zero();

  set movement(Vector2 m) => movement = m;
  Vector2 get movement => _movement;

  late SpriteSheet sprite;

  late SpriteAnimation idleDied;

  late SpriteAnimation idleUp;
  late SpriteAnimation idleDown;
  late SpriteAnimation idleRight;
  late SpriteAnimation idleLeft;

  late SpriteAnimation upAnimation;
  late SpriteAnimation downAnimation;
  late SpriteAnimation rightAnimation;
  late SpriteAnimation leftAnimation;

  late SpriteAnimation attackUpAnimation;
  late SpriteAnimation attackDownAnimation;
  late SpriteAnimation attackRightAnimation;
  late SpriteAnimation attackLeftAnimation;

  late ShapeHitbox hitbox;
  late int rowAnimation;

  int health = 2;

  Player(MyGame game) : super(size: Vector2.all(game.tileSizeInPixels)) {
    _game = game;
    _keyboardListener = MyKeyboardListener();
    _movementObserver = ActionsObserver(_game, _keyboardListener, this);

    // debugMode = true;
  }

  Future<void> skin(SpriteSheet sprite) async {
    // sem boné
    health == 1 ? rowAnimation = 1 : rowAnimation = 0;
    idleUp =
        sprite.createAnimation(row: rowAnimation + 6, stepTime: 0.5, to: 1);
    idleDown =
        sprite.createAnimation(row: rowAnimation + 0, stepTime: 0.5, to: 1);
    idleRight = sprite.createAnimation(
        row: rowAnimation + 8, stepTime: 0.5, from: 5, to: 6);
    idleLeft = sprite.createAnimation(
        row: rowAnimation + 8, stepTime: 0.5, from: 6, to: 7);

    upAnimation =
        sprite.createAnimation(row: rowAnimation + 8, stepTime: 0.2, to: 2);
    downAnimation = sprite.createAnimation(
        row: rowAnimation + 8, stepTime: 0.2, from: 2, to: 4);
    rightAnimation = sprite.createAnimation(
        row: rowAnimation + 8, stepTime: 0.2, from: 4, to: 6);
    leftAnimation = sprite.createAnimation(
        row: rowAnimation + 8, stepTime: 0.2, from: 6, to: 8);

    attackUpAnimation =
        sprite.createAnimation(row: rowAnimation + 4, stepTime: 0.06);
    attackDownAnimation =
        sprite.createAnimation(row: rowAnimation + 2, stepTime: 0.06);
    attackRightAnimation =
        sprite.createAnimation(row: rowAnimation + 12, stepTime: 0.06);
    attackLeftAnimation =
        sprite.createAnimation(row: rowAnimation + 10, stepTime: 0.06);

    if (health == 2) {
      animation = idleUp;
      size = Vector2.all(_game.tileSizeInPixels * 2);
    }
  }

  void takeDamage() {
    health -= 1;
    _game.logger.log('Player sofreu dano. Vida atual: $health');
    if (health == 0) {
      idleDied = sprite.createAnimation(row: 14, stepTime: 0.1, from: 5, to: 6);
      animation = idleDied;
      canWalk = false;
      moveSpeed = 0;
    } else {
      skin(sprite);
    }
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    _game.logger.log('Carregando hitbox e sprite do player');
    // manter a ordem de adicionar o hitbox antes da skin, senão buga
    hitbox = RectangleHitbox(
        size: Vector2.all(_game.tileSizeInPixels), position: center);
    sprite = SpriteSheet(
        image: await Flame.images.load('player.png'),
        srcSize: Vector2.all(_game.tileSizeInPixels));
    add(hitbox);
    skin(sprite);

    position = Vector2(367, 557);
    priority = 1;
  }

  @override
  void update(double dt) {
    // não andar mais rápido na diagonal do que em apenas um eixo
    if (_movement.x != 0 && _movement.y != 0) {
      _velocity = _movement * moveSpeed / 1.5;
    } else {
      _velocity = _movement * moveSpeed;
    }
    position += _velocity * dt;

    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (canWalk) {
      _movement = Vector2.zero();
      _keyboardListener.keysPressed = keysPressed;
      _keyboardListener.notifyObservers();
    }

    return true;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is HD) {
      if (_vulnerable) {
        // tempo de invencibilidade depois de tomar dano
        Timer(const Duration(seconds: 2), () => _vulnerable = true);
        takeDamage();
        _vulnerable = false;
      }
    }

    if (other is Wall) {
      if (position.y < _game.tileSizeInPixels) {
        position.y = _game.tileSizeInPixels;
      }

      if (position.y > _game.mapHeightInPixels - _game.tileSizeInPixels) {
        position.y = _game.mapHeightInPixels - _game.tileSizeInPixels;
      }

      if (position.x < -_game.tileSizeInPixels / 2) {
        position.x = -_game.tileSizeInPixels / 2;
      }

      if (position.x > _game.mapWidthInPixels - _game.tileSizeInPixels * 1.5) {
        position.x = _game.mapWidthInPixels - _game.tileSizeInPixels * 1.5;
      }
    }

    // TODO: colisão com as mesas
    // if ((other is Table) & (intersectionPoints.length == 2)) {}

    super.onCollision(intersectionPoints, other);
  }
}
