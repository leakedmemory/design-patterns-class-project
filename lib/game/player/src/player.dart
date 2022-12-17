import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/services.dart';

import '../../map_maker/map_maker.dart';
import '../../my_game.dart';
import 'keyboard_listener.dart';
import 'movement_observer.dart';

class Player extends SpriteAnimationComponent
    with KeyboardHandler, CollisionCallbacks {
  late final CustomKeyboardListener _keyboardListener;
  // ignore: unused_field
  late final MovementObserver _movementObserver;

  late final MyGame game;

  bool inCombat = false;
  
  bool canWalk = true;
  final _moveSpeed = 140.0;
  Vector2 _movement = Vector2.zero();
  Vector2 _velocity = Vector2.zero();

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

  Player(MyGame _game) : super(size: Vector2.all(_game.tileSizeInPixels)) {
    game = _game;
    _keyboardListener = CustomKeyboardListener();
    _movementObserver = MovementObserver(_keyboardListener, this);

    // debugMode = true;
  }

  Future<void> skin(SpriteSheet sprite) async {
    // sem boné
    health == 1 ? rowAnimation = 1 : rowAnimation = 0;
    idleUp =
        sprite.createAnimation(row: rowAnimation + 6, stepTime: 0.5, to: 1);
    idleDown =
        sprite.createAnimation(row: rowAnimation + 0, stepTime: 0.5, to: 1);
    // mudar quando lucas mandar a nova idle
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
        sprite.createAnimation(row: rowAnimation + 4, stepTime: 0.1);
    attackDownAnimation =
        sprite.createAnimation(row: rowAnimation + 2, stepTime: 0.1);
    attackRightAnimation =
        sprite.createAnimation(row: rowAnimation + 12, stepTime: 0.1);
    attackLeftAnimation =
        sprite.createAnimation(row: rowAnimation + 10, stepTime: 0.1);

    if (health == 2) {
      animation = idleUp;
      size = Vector2.all(game.tileSizeInPixels * 2);
    }
  }

  Future<void> takeDamage() async {
    health -= 1;
    if (health == 0) {
      idleDied = sprite.createAnimation(row: 14, stepTime: 0.1, from: 5, to: 6);
      animation = idleDied;
      canWalk = false;
      // acaba o jogo
    } else {
      // muda a sprite
      skin(sprite);
    }
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    hitbox = RectangleHitbox(
        size: Vector2.all(game.tileSizeInPixels), position: center);
    sprite = SpriteSheet(
        image: await Flame.images.load('player.png'),
        srcSize: Vector2.all(game.tileSizeInPixels));
    add(hitbox);
    skin(sprite);

    position = Vector2(367, 557);
    priority = 1;
  }

  @override
  void update(double dt) {
    // não andar mais rápido na diagonal do que em apenas um eixo
    if (_movement.x != 0 && _movement.y != 0) {
      _velocity = _movement * _moveSpeed / 1.5;
    } else {
      _velocity = _movement * _moveSpeed;
    }
    position += _velocity * dt;

    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    _movement = Vector2.zero();
    _keyboardListener.keysPressed = keysPressed;
    if (canWalk) {
      _keyboardListener.notifyObservers();
    }

    return true;
  }

  set movement(Vector2 m) => movement = m;
  Vector2 get movement => _movement;

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Wall) {
      if (position.y < game.tileSizeInPixels) {
        position.y = game.tileSizeInPixels;
      }

      if (position.y > game.mapHeightInPixels - game.tileSizeInPixels) {
        position.y = game.mapHeightInPixels - game.tileSizeInPixels;
      }

      if (position.x < -game.tileSizeInPixels / 2) {
        position.x = -game.tileSizeInPixels / 2;
      }

      if (position.x > game.mapWidthInPixels - game.tileSizeInPixels * 1.5) {
        position.x = game.mapWidthInPixels - game.tileSizeInPixels * 1.5;
      }
    }
    //? TODO: falta fazer colisão com as mesas, isso aí funciona, mas fica como
    //? se quisesse entrar nas bordas da sprite
    /* if ((other is Table) & (intersectionPoints.length == 2)) {
      final mid = game.tileSizeInPixels / 2;

      final interval = {
        Vector2(position.x - mid, position.y - mid),
        Vector2(position.x + mid, position.y - mid)
      };
    } */

    super.onCollision(intersectionPoints, other);
  }
}
