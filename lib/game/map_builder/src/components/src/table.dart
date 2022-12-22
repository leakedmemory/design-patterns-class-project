import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../../../my_game.dart';
import 'my_component.dart';

enum TableComponentType {
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

  topLeftCornerCoffee,
  topRightCornerCoffee,
  middleLeftCornerCoffee,
  middleRightCornerCoffee,
  bottomLeftCornerCoffee,
  bottomRightCornerCoffee,
}

class TableComponent extends MyComponent with CollisionCallbacks {
  late final MyGame _game;

  late final Map<TableComponentType, Sprite> _types = {
    TableComponentType.topLeftCornerTurn: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(0, 4))),
    TableComponentType.leftCornerTurn: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(0, 5))),
    TableComponentType.turnToRight: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(0, 6))),
    TableComponentType.doubleFeet: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(0, 7))),
    TableComponentType.topLeftCorner: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(1, 4))),
    TableComponentType.topCorner: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(2, 4))),
    TableComponentType.topRightCorner: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(3, 4))),
    TableComponentType.leftCorner: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(1, 5))),
    TableComponentType.center: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(2, 5))),
    TableComponentType.rightCorner: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(3, 5))),
    TableComponentType.bottomLeftCorner: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(1, 6))),
    TableComponentType.bottomCorner: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(2, 6))),
    TableComponentType.bottomRightCorner: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(3, 6))),
    TableComponentType.topLeftCornerCoffee: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(10, 38))),
    TableComponentType.topRightCornerCoffee: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(11, 38))),
    TableComponentType.middleLeftCornerCoffee: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(10, 39))),
    TableComponentType.middleRightCornerCoffee: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(11, 39))),
    TableComponentType.bottomLeftCornerCoffee: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(10, 40))),
    TableComponentType.bottomRightCornerCoffee: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(11, 40))),
  };

  TableComponent(MyGame game, TableComponentType type, Vector2 position,
      {int priority = 0})
      : super(game, position, priority) {
    _game = game;
    sprite = _types[type];
    add(RectangleHitbox()..collisionType = CollisionType.passive);
  }
}
