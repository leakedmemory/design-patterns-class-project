import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../../../my_game.dart';
import 'my_component.dart';

enum ChairComponentType {
  brownUpTop,
  brownUpBottom,
}

class ChairComponent extends MyComponent with CollisionCallbacks {
  late final MyGame _game;

  late final Map<ChairComponentType, Sprite> _types = {
    ChairComponentType.brownUpTop: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(1, 10))),
    ChairComponentType.brownUpBottom: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(1, 11))),
  };

  ChairComponent(MyGame game, ChairComponentType type, Vector2 position,
      {int priority = 0})
      : super(game, position, priority) {
    _game = game;
    sprite = _types[type];
  }
}
