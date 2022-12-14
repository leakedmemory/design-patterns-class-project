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

  late final SpriteAnimation idle;
  late final SpriteAnimation upAnimation;
  late final SpriteAnimation downAnimation;
  late ShapeHitbox hitbox;

  Player(MyGame game) : super(size: Vector2.all(game.tileSizeInPixels)) {
    _game = game;
    _keyboardListener = CustomKeyboardListener();
    _movementObserver = MovementObserver(_keyboardListener, this);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    SpriteSheet sprite = SpriteSheet(
        image: await Flame.images.load('player.png'), srcSize: Vector2(48, 66));

    hitbox = RectangleHitbox();
    add(hitbox);
    idle = sprite.createAnimation(row: 0, stepTime: 0.5, to: 1);
    upAnimation = sprite.createAnimation(row: 1, stepTime: 0.2);
    downAnimation = sprite.createAnimation(row: 0, stepTime: 0.2);

    animation = idle;
    position = Vector2(100, 200);
    size = Vector2(_game.tileSizeInPixels, _game.tileSizeInPixels * 2);
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
