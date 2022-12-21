import 'package:flame/collisions.dart';
import 'package:flame/input.dart';
import 'package:flame/widgets.dart';

import '../../../../my_game.dart';
import 'my_component.dart';

enum PlantComponentType {
  littlePlantTop,
  littlePlantBottom,

  bigPlantTop,
  bigPlantMiddle,
  bigPlantBottom,

  cactusTop,
  cactusMiddle,
  cactusBottom,
}

class PlantComponent extends MyComponent with CollisionCallbacks {
  late final MyGame _game;

  late final Map<PlantComponentType, Sprite> _types = {
    PlantComponentType.littlePlantTop: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(6, 10))),
    PlantComponentType.littlePlantBottom: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(6, 11))),
    PlantComponentType.bigPlantTop: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(6, 7))),
    PlantComponentType.bigPlantMiddle: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(6, 8))),
    PlantComponentType.bigPlantBottom: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(6, 9))),
    PlantComponentType.cactusTop: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(6, 12))),
    PlantComponentType.cactusMiddle: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(6, 13))),
    PlantComponentType.cactusBottom: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(6, 14))),
  };

  PlantComponent(MyGame game, PlantComponentType type, Vector2 position,
      {int priority = 0})
      : super(game, position, priority) {
    _game = game;
    sprite = _types[type];
  }
}
