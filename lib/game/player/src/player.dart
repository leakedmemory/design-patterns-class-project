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
    with HasGameRef, KeyboardHandler, CollisionCallbacks {
  late final CustomKeyboardListener _keyboardListener;
  late final MovementObserver _movementObserver;

  late final MyGame _game;

  final _moveSpeed = 135.0;
  Vector2 _movement = Vector2.zero();
  Vector2 _velocity = Vector2.zero();

  late SpriteSheet sprite;
  late SpriteAnimation idleUp;
  late SpriteAnimation idleDown;
  late SpriteAnimation idleRight;
  late SpriteAnimation idleLeft;

  late SpriteAnimation upAnimation;
  late SpriteAnimation downAnimation;
  late SpriteAnimation rightAnimation;
  late SpriteAnimation leftAnimation;

  late SpriteAnimation atackUpAnimation;
  late SpriteAnimation atackDownAnimation;
  late SpriteAnimation atackRightAnimation;
  late SpriteAnimation atackLeftAnimation;

  late ShapeHitbox hitbox;
  int health = 2;
  late int rowAnimation;

  Player(MyGame game) : super(size: Vector2.all(game.tileSizeInPixels)) {
    _game = game;
    _keyboardListener = CustomKeyboardListener();
    _movementObserver = MovementObserver(_keyboardListener, this);
    debugMode = true;
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

    atackUpAnimation =
        sprite.createAnimation(row: rowAnimation + 4, stepTime: 0.1);
    atackDownAnimation =
        sprite.createAnimation(row: rowAnimation + 2, stepTime: 0.1);
    atackRightAnimation =
        sprite.createAnimation(row: rowAnimation + 2, stepTime: 0.1);
    atackLeftAnimation =
        sprite.createAnimation(row: rowAnimation + 2, stepTime: 0.1);

    if (health == 2) {
      animation = idleDown;
    }
    
    size = Vector2.all(_game.tileSizeInPixels * 2);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = SpriteSheet(
        image: await Flame.images.load('player.png'),
        srcSize: Vector2.all(_game.tileSizeInPixels));

    hitbox = RectangleHitbox(size: Vector2(32, 32), position: center);
    add(hitbox);
    skin(sprite);
    position = Vector2(100, 250);
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
    _keyboardListener.notifyObservers();

    return true;
  }

  set movement(Vector2 m) => movement = m;
  Vector2 get movement => _movement;

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Wall) {
      if (position.y < _game.tileSizeInPixels) {
        position.y = _game.tileSizeInPixels;
      }

      if (position.y > _game.mapHeightInPixels - _game.tileSizeInPixels * 2) {
        position.y = _game.mapHeightInPixels - _game.tileSizeInPixels * 2;
      }

      if (position.x < 0) {
        position.x = 0;
      }

      if (position.x > _game.mapWidthInPixels - _game.tileSizeInPixels) {
        position.x = _game.mapWidthInPixels - _game.tileSizeInPixels;
      }
    }

    super.onCollision(intersectionPoints, other);
  }
}
