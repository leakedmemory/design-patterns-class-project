import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../../my_game.dart';
import '../abstractions/my_component.dart';

enum TableType {
  doubleFeet,
  turnToRight,
  leftAboveTurn,
  leftCornerTurn,
  bottomCorner,
  bottomRightCornerTurn,
  center,
  rightCorner,
  topCorner,
  topRightCornerTurn,
  bottomLeftCorner,
  topLeftCorner,
  topRightCorner,
  bottomRightCorner,
}

class Table extends MyComponent with CollisionCallbacks {
  late final MyGame _game;

  late final Map<TableType, Sprite> _types = {
    TableType.doubleFeet:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(0, 7)),
    TableType.turnToRight:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(0, 6)),
    TableType.leftAboveTurn:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(0, 5)),
    TableType.leftCornerTurn:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(0, 4)),
    TableType.bottomCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(2, 6)),
    TableType.bottomRightCornerTurn:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(3, 6)),
    TableType.center:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(2, 5)),
    TableType.rightCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(3, 5)),
    TableType.topCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(2, 4)),
    TableType.topRightCornerTurn:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(3, 4)),
    TableType.bottomLeftCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(7, 31)),
    TableType.topLeftCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(7, 30)),
    TableType.topRightCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(9, 30)),
    TableType.bottomRightCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(9, 31)),
  };

  Table(MyGame game, TableType type, Vector2 position) : super(game, position) {
    _game = game;
    sprite = _types[type];
  }
}
