import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../../my_game.dart';
import '../abstractions/my_component.dart';

enum TableType {
  topLeftCornerTurn,
  leftCornerTurn,
  turnToRight,
  doubleFeet,

  topLeftCorner,
  topCorner,
  topRightCorner,
  leftCorner,
  center,
  rightCorner,
  bottomLeftCorner,
  bottomCorner,
  bottomRightCorner,

  topLeftCornerMini,
  topRightCornerMini,
  bottomLeftCornerMini,
  bottomRightCornerMini,
}

class Table extends MyComponent with CollisionCallbacks {
  late final MyGame _game;

  late final Map<TableType, Sprite> _types = {
    TableType.topLeftCornerTurn:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(0, 4)),
    TableType.leftCornerTurn:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(0, 5)),
    TableType.turnToRight:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(0, 6)),
    TableType.doubleFeet:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(0, 7)),
    TableType.topLeftCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(1, 4)),
    TableType.topCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(2, 4)),
    TableType.topRightCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(3, 4)),
    TableType.leftCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(1, 5)),
    TableType.center:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(2, 5)),
    TableType.rightCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(3, 5)),
    TableType.bottomLeftCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(1, 6)),
    TableType.bottomCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(2, 6)),
    TableType.bottomRightCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(3, 6)),
    TableType.topLeftCornerMini:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(6, 22)),
    TableType.topRightCornerMini:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(7, 22)),
    TableType.bottomLeftCornerMini:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(6, 23)),
    TableType.bottomRightCornerMini:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(7, 23)),
  };

  Table(MyGame game, TableType type, Vector2 position) : super(game, position) {
    _game = game;
    sprite = _types[type];
  }
}
