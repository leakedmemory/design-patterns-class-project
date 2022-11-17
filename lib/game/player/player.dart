import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';

import '../my_game.dart';

class Player extends SpriteComponent
    with HasGameRef, KeyboardHandler, CollisionCallbacks {
  Vector2 _input = Vector2.zero();
  final _moveSpeed = 100.0;
  final _velocity = Vector2.zero();

  Player() : super(size: Vector2.all(MyGame.tileSize));

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('player/idle.png');
    // position = gameRef.size / 2;
    position = Vector2.all(10);
  }

  @override
  void update(double dt) {
    _velocity.x = _input.x * _moveSpeed;
    _velocity.y = _input.y * _moveSpeed;

    position += _velocity * dt;
    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    _input = Vector2.zero();
    _input.x += keysPressed.contains(LogicalKeyboardKey.keyA) ? -1 : 0;
    _input.x += keysPressed.contains(LogicalKeyboardKey.keyD) ? 1 : 0;

    _input.y += keysPressed.contains(LogicalKeyboardKey.keyW) ? -1 : 0;
    _input.y += keysPressed.contains(LogicalKeyboardKey.keyS) ? 1 : 0;

    return true;
  }

  // TODO: colisão com a borda da tela
  // @override
  // void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
  //   super.onCollision(intersectionPoints, other);
  // }
}
