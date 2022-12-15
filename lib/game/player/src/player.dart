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

  late final MyGame _game;

  final _moveSpeed = 135.0;
  Vector2 _movement = Vector2.zero();
  Vector2 _velocity = Vector2.zero();

  late final SpriteSheet sprite;
  late final SpriteAnimation idleUp;
  late final SpriteAnimation idleDown;
  late final SpriteAnimation idleRight;
  late final SpriteAnimation idleLeft;

  late final SpriteAnimation upAnimation;
  late final SpriteAnimation downAnimation;
  late final SpriteAnimation rightAnimation;
  late final SpriteAnimation leftAnimation;

  late final SpriteAnimation attackUpAnimation;
  late final SpriteAnimation attackDownAnimation;
  late final SpriteAnimation attackRightAnimation;
  late final SpriteAnimation attackLeftAnimation;

  late ShapeHitbox hitbox;
  late int rowAnimation;

  int health = 2;

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

    attackUpAnimation =
        sprite.createAnimation(row: rowAnimation + 4, stepTime: 0.1);
    attackDownAnimation =
        sprite.createAnimation(row: rowAnimation + 2, stepTime: 0.1);
    attackRightAnimation =
        sprite.createAnimation(row: rowAnimation + 2, stepTime: 0.1);
    attackLeftAnimation =
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
    skin(sprite);

    hitbox = CircleHitbox(radius: _game.tileSizeInPixels / 2, position: center);
    add(hitbox);
    skin(sprite);
    position = Vector2(125, 475);
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

      if (position.y > _game.mapHeightInPixels - _game.tileSizeInPixels) {
        position.y = _game.mapHeightInPixels - _game.tileSizeInPixels;
      }

      if (position.x < 0) {
        position.x = 0;
      }

      if (position.x > _game.mapWidthInPixels - _game.tileSizeInPixels * 2) {
        position.x = _game.mapWidthInPixels - _game.tileSizeInPixels * 2;
      }
    }

    //falta fazer colisao com as mesas, isso ai funciona mas fica como se quisesse entrar nas bordas da sprite
    if (other is Table) {
      // if (intersectionPoints.length == 2) {
      //   final mid = (intersectionPoints.elementAt(0) +
      //           intersectionPoints.elementAt(1)) /
      //       2;

      //   final collisionNormal = absoluteCenter - mid;
      //   final separationDistance = (size.x / 4) - collisionNormal.length;
      //   collisionNormal.normalize();

      //   position += collisionNormal.scaled(separationDistance);
      // }
    }

    super.onCollision(intersectionPoints, other);
  }
}
