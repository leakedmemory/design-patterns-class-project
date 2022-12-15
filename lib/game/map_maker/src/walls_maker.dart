import 'package:flame/components.dart';

import 'abstractions/component_maker.dart';
import '../../my_game.dart';
import 'components/wall.dart';

class WallsMaker implements ComponentMaker<Wall, WallType> {
  late final MyGame _game;

  WallsMaker(MyGame game) {
    _game = game;
  }

  @override
  Wall setSpriteTileOnMap(WallType type, double x, double y,
      {int priority = 0}) {
    return Wall(_game, type,
        Vector2(_game.tileSizeInPixels * x, _game.tileSizeInPixels * y),
        priority: priority);
  }

  @override
  List<Wall> make() {
    List<Wall> walls = [
      ..._createTopWalls(),
      ..._createBottomWalls(),
      ..._createRightWalls(),
      ..._createLeftWalls(),
    ];

    return walls;
  }

  List<Wall> _createTopWalls() {
    List<Wall> walls = [];
    for (double x = 0; x < _game.mapWidthInTiles; x++) {
      walls.add(setSpriteTileOnMap(WallType.brownTop, x, 0));
      walls.add(setSpriteTileOnMap(WallType.brownBottom, x, 1));
    }

    return walls;
  }

  List<Wall> _createBottomWalls() {
    List<Wall> walls = [];
    for (double x = 0; x < _game.mapWidthInTiles; x++) {
      // ignora tile da porta de entrada
      if (x != 12) {
        walls.add(setSpriteTileOnMap(
            WallType.whiteBottom, x, _game.mapHeightInTiles,
            priority: 5));
      }
    }

    return walls;
  }

  List<Wall> _createRightWalls() {
    List<Wall> walls = [];
    for (double y = 0; y < _game.mapHeightInTiles; y++) {
      walls.add(setSpriteTileOnMap(WallType.whiteRight, 0, y, priority: 5));
    }

    return walls;
  }

  List<Wall> _createLeftWalls() {
    List<Wall> walls = [];
    for (double y = 0; y < _game.mapHeightInTiles; y++) {
      walls.add(setSpriteTileOnMap(
          WallType.whiteLeft, _game.mapWidthInTiles - 1, y,
          priority: 5));
    }

    return walls;
  }
}
