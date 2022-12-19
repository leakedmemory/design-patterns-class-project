import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../../my_game.dart';
import '../abstractions/my_component.dart';

enum ChairType {
  brownUpTop,
  brownUpBottom,
}

class Chair extends MyComponent with CollisionCallbacks {
  late final MyGame _game;

  late final Map<ChairType, Sprite> _types = {
    ChairType.brownUpTop:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(1, 10)),
    ChairType.brownUpBottom:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(1, 11)),
  };

  Chair(MyGame game, ChairType type, Vector2 position, {int priority = 0})
      : super(game, position, priority) {
    _game = game;
    sprite = _types[type];
  }
}
