import 'package:flame/components.dart';

import '../../../my_game.dart';

abstract class MyComponent extends SpriteComponent {
  late final MyGame _game;
  late final Vector2 _position;

  MyComponent(MyGame game, Vector2 position) {
    _game = game;
    _position = position;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    position = _position;
    size = Vector2.all(_game.tileSizeInPixels);
  }

  Vector2 getSpriteTile(int x, int y) {
    return Vector2(_game.tileSizeInPixels * x, _game.tileSizeInPixels * y);
  }
}
