import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/services.dart';

import 'package:design_patterns_project/game/my_game.dart';
import 'package:design_patterns_project/game/utils/observer.dart';
import 'package:design_patterns_project/game/player/src/keyboard_listener.dart';
import 'package:design_patterns_project/game/player/src/movement_observer.dart';

class Player extends SpriteAnimationComponent
    with HasGameRef, KeyboardHandler, CollisionCallbacks {
  late final Subject<Set<String>, Set<LogicalKeyboardKey>> _keyboardListener;
  late final Observer<Set<String>> _movementObserver;

  final _moveSpeed = 135.0;
  Vector2 _movement = Vector2.zero();
  Vector2 _velocity = Vector2.zero();

  late final SpriteAnimation idle;
  late final SpriteAnimation upAnimation;
  late final SpriteAnimation downAnimation;
  late ShapeHitbox hitbox;

  Player(MyGame game) : super(size: Vector2.all(game.tileSize)) {
    _keyboardListener = CustomKeyboardListener();
    _movementObserver = MovementObserver(_keyboardListener, this);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    SpriteSheet sprite = SpriteSheet(
        image: await Flame.images.load("player/test.png"),
        srcSize: Vector2(48, 66));

    hitbox = CircleHitbox();
    add(hitbox);
    idle = sprite.createAnimation(row: 0, stepTime: 0.5, to: 1);
    upAnimation = sprite.createAnimation(row: 1, stepTime: 0.2);
    downAnimation = sprite.createAnimation(row: 0, stepTime: 0.2);

    animation = idle;
    position = Vector2(100, 200);
    size = Vector2(32, 64);
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
    _keyboardListener.state = keysPressed;
    _keyboardListener.notifyObservers();

    return true;
  }

  set movement(Vector2 m) => movement = m;
  Vector2 get movement => _movement;

  // TODO: colisão com os blocos
  // @override
  // void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
  //   if (other is ScreenHitbox) {}
  // }
}
