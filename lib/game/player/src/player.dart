import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';

import 'package:design_patterns_project/game/my_game.dart';
import 'package:design_patterns_project/game/utils/observer.dart';
import 'package:design_patterns_project/game/player/src/keyboard_listener.dart';
import 'package:design_patterns_project/game/player/src/movement_observer.dart';

class Player extends SpriteComponent
    with HasGameRef, KeyboardHandler, CollisionCallbacks {
  Vector2 _movement = Vector2.zero();
  late final Subject<Set<String>, Set<LogicalKeyboardKey>> _keyboardListener;
  late final Observer<Set<String>> _movementObserver;

  final _moveSpeed = 150.0;
  final _velocity = Vector2.zero();

  Player() : super(size: Vector2.all(MyGame.tileSize)) {
    _keyboardListener = CustomKeyboardListener();
    _movementObserver = MovementObserver(_keyboardListener, this);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite(
      'player/idle.png',
      // srcSize: Vector2(MyGame.tileSize, MyGame.tileSize * 2)
    );
    position = Vector2.all(200);
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
