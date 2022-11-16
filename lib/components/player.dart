import 'package:flame/components.dart';
import 'package:flutter/services.dart';

class Player extends SpriteComponent with HasGameRef, KeyboardHandler {
  int _xAxisInput = 0;
  int _yAxisInput = 0;
  final _moveSpeed = 200.0;
  final _velocity = Vector2.zero();
  Player() : super(size: Vector2.all(100.0));

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('player/idle.png');
    position = gameRef.size / 2;
  }

  @override
  void update(double dt) {
    _velocity.x = _xAxisInput * _moveSpeed;
    _velocity.y = _yAxisInput * _moveSpeed;

    position += _velocity * dt;
    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    _xAxisInput = 0;
    _xAxisInput += keysPressed.contains(LogicalKeyboardKey.keyA) ? -1 : 0;
    _xAxisInput += keysPressed.contains(LogicalKeyboardKey.keyD) ? 1 : 0;

    _yAxisInput = 0;
    _yAxisInput += keysPressed.contains(LogicalKeyboardKey.keyW) ? -1 : 0;
    _yAxisInput += keysPressed.contains(LogicalKeyboardKey.keyS) ? 1 : 0;

    return true;
  }
}
