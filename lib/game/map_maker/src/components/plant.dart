import 'package:flame/collisions.dart';
import 'package:flame/input.dart';
import 'package:flame/widgets.dart';

import '../../../my_game.dart';
import '../abstractions/my_component.dart';

enum PlantType {
  littlePlantTop,
  littlePlantBottom,

  bigPlantTop,
  bigPlantMiddle,
  bigPlantBottom,

  cactusTop,
  cactusMiddle,
  cactusBottom,
}

class Plant extends MyComponent with CollisionCallbacks {
  late final MyGame _game;

  late final Map<PlantType, Sprite> _types = {
    PlantType.littlePlantTop:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(6, 10)),
    PlantType.littlePlantBottom:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(6, 11)),
    PlantType.bigPlantTop:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(6, 7)),
    PlantType.bigPlantMiddle:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(6, 8)),
    PlantType.bigPlantBottom:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(6, 9)),
    PlantType.cactusTop:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(6, 12)),
    PlantType.cactusMiddle:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(6, 13)),
    PlantType.cactusBottom:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(6, 14)),
  };

  Plant(MyGame game, PlantType type, Vector2 position) : super(game, position) {
    _game = game;
    sprite = _types[type];
  }
}
