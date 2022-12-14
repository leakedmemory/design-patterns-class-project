import 'package:flame/components.dart';

import 'abstractions/maker.dart';
import '../../my_game.dart';
import 'components/wall.dart';

class WallMaker implements Maker<Wall> {
  late final MyGame _game;

  WallMaker(MyGame game) {
    _game = game;
  }

  Wall _setSpriteTileOnMap(WallType type, double x, double y) {
    return Wall(_game, type,
        Vector2(_game.tileSizeInPixels * x, _game.tileSizeInPixels * y));
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
      walls.add(_setSpriteTileOnMap(WallType.brownTop, x, 0));
      walls.add(_setSpriteTileOnMap(WallType.brownBottom, x, 1));
    }

    return walls;
  }

  List<Wall> _createBottomWalls() {
    List<Wall> walls = [];
    for (double x = 0; x < _game.mapWidthInTiles; x++) {
      // ignora tile da porta de entrada
      if (x != 12) {
        walls.add(_setSpriteTileOnMap(
            WallType.whiteBottom, x, _game.mapHeightInTiles));
      }
    }

    return walls;
  }

  List<Wall> _createRightWalls() {
    List<Wall> walls = [];
    for (double y = 0; y < _game.mapHeightInTiles; y++) {
      walls.add(_setSpriteTileOnMap(WallType.whiteRight, 0, y));
    }

    return walls;
  }

  List<Wall> _createLeftWalls() {
    List<Wall> walls = [];
    for (double y = 0; y < _game.mapHeightInTiles; y++) {
      walls.add(_setSpriteTileOnMap(
          WallType.whiteLeft, _game.mapWidthInTiles - 1, y));
    }

    return walls;
  }
}
