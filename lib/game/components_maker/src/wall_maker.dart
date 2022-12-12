import 'package:flame/components.dart';

import 'abstractions/maker.dart';
import '../../my_game.dart';
import 'components/wall.dart';

class WallMaker implements Maker<Wall> {
  late final MyGame _game;

  WallMaker(MyGame game) {
    _game = game;
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
    for (double x = 0; x < _game.mapWidth; x += _game.tileSize) {
      walls.add(Wall(_game, 'brown_top', Vector2(x, 0)));
      walls.add(Wall(_game, 'brown_bottom', Vector2(x, _game.tileSize)));
    }

    return walls;
  }

  List<Wall> _createBottomWalls() {
    List<Wall> walls = [];
    for (double x = 0; x < _game.mapWidth; x += _game.tileSize) {
      walls.add(Wall(_game, 'white_bottom', Vector2(x, _game.mapHeight)));
    }

    return walls;
  }

  List<Wall> _createRightWalls() {
    List<Wall> walls = [];
    for (double y = 0; y < _game.mapHeight; y += _game.tileSize) {
      walls.add(Wall(_game, 'white_right', Vector2(0, y)));
    }

    return walls;
  }

  List<Wall> _createLeftWalls() {
    List<Wall> walls = [];
    for (double y = 0; y < _game.mapHeight; y += _game.tileSize) {
      walls.add(Wall(
          _game, 'white_left', Vector2(_game.mapWidth - _game.tileSize, y)));
    }

    return walls;
  }
}
