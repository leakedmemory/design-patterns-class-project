import 'package:flame/components.dart';

import '../../../../my_game.dart';

abstract class MyComponent extends SpriteComponent {
  late final MyGame _game;
  late final Vector2 _position;
  late final int _priority;

  MyComponent(MyGame game, Vector2 position, [int priority = 0]) {
    _game = game;
    _position = position;
    _priority = priority;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    position = _position;
    size = Vector2.all(_game.tileSizeInPixels);
    priority = _priority;
  }

  Vector2 getSpriteTile(Vector2 tilePosition) {
    return tilePosition * _game.tileSizeInPixels;
  }
}
