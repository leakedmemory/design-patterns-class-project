import 'package:flame/components.dart';

import '../../../../my_game.dart';
import '../../../map_maker.dart';
import 'object_factory.dart';

class WallFactory implements ObjectFactory<WallComponent, WallComponentType> {
  late final MyGame _game;
  static const int _defaultPriority = 5;

  WallFactory(MyGame game) {
    _game = game;
  }

  @override
  WallComponent createSpriteComponent(
      {required WallComponentType type,
      required double tilePositionX,
      required double tilePositionY,
      required int priority}) {
    return WallComponent(_game, type,
        Vector2(tilePositionX, tilePositionY) * _game.tileSizeInPixels,
        priority: priority);
  }

  List<WallComponent> createTopWalls() {
    List<WallComponent> walls = [];
    for (double x = 0; x < _game.mapWidthInTiles; x++) {
      walls.add(createSpriteComponent(
          type: WallComponentType.brownTop,
          tilePositionX: x,
          tilePositionY: 0,
          priority: _defaultPriority));
      walls.add(createSpriteComponent(
          type: WallComponentType.brownBottom,
          tilePositionX: x,
          tilePositionY: 1,
          priority: 3));
    }

    return walls;
  }

  List<WallComponent> createBottomWalls() {
    List<WallComponent> walls = [];
    for (double x = 0; x < _game.mapWidthInTiles; x++) {
      // ignora tile da porta de entrada
      if (x != 12) {
        walls.add(createSpriteComponent(
            type: WallComponentType.whiteBottom,
            tilePositionX: x,
            tilePositionY: _game.mapHeightInTiles,
            priority: _defaultPriority));
      }
    }

    return walls;
  }

  List<WallComponent> createRightWalls() {
    List<WallComponent> walls = [];
    for (double y = 0; y < _game.mapHeightInTiles; y++) {
      walls.add(createSpriteComponent(
          type: WallComponentType.whiteRight,
          tilePositionX: 0,
          tilePositionY: y,
          priority: _defaultPriority));
    }

    return walls;
  }

  List<WallComponent> createLeftWalls() {
    List<WallComponent> walls = [];
    for (double y = 0; y < _game.mapHeightInTiles; y++) {
      walls.add(createSpriteComponent(
          type: WallComponentType.whiteLeft,
          tilePositionX: _game.mapWidthInTiles - 1,
          tilePositionY: y,
          priority: _defaultPriority));
    }

    return walls;
  }
}
