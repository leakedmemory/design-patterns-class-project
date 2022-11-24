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
  Vector2 _movement = Vector2.zero();
  late final Subject<Set<String>, Set<LogicalKeyboardKey>> _keyboardListener;
  late final Observer<Set<String>> _movementObserver;

  final _moveSpeed = 125.0;
  final _velocity = Vector2.zero();

  late SpriteAnimation idleUpAnimation;
  late SpriteAnimation idleDownAnimation;

  late SpriteAnimation upAnimation;
  late SpriteAnimation downAnimation;
  late SpriteAnimationComponent player;
  // 0 = up // 1 = left // 2 = right // 3 = down // 4 = idle
  int direction = 0;

  Player() : super(size: Vector2.all(MyGame.tileSize)) {
    _keyboardListener = CustomKeyboardListener();
    _movementObserver = MovementObserver(_keyboardListener, this);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    SpriteSheet sprite = SpriteSheet(
        image: await Flame.images.load("player/test.png"),
        srcSize: Vector2(48, 66));
    // mudar
    idleUpAnimation = sprite.createAnimation(row: 1, stepTime: 0.5, to: 1);
    idleDownAnimation = sprite.createAnimation(row: 0, stepTime: 0.5, to: 1);

    upAnimation = sprite.createAnimation(row: 1, stepTime: 0.3);
    downAnimation = sprite.createAnimation(row: 0, stepTime: 0.3);
    size = Vector2(48, 96);

    player = SpriteAnimationComponent()
      ..animation = idleDownAnimation
      ..position = Vector2(100, 200)
      ..size = Vector2(48, 66);

    add(player);
  }

  @override
  void update(double dt) {
        
    _velocity.x = _movement.x * _moveSpeed;
    _velocity.y = _movement.y * _moveSpeed;

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

  // TODO: colisão com a borda da tela
  // @override
  // void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
  //   super.onCollision(intersectionPoints, other);
  // }
}
