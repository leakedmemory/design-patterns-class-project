import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../../../my_game.dart';
import 'my_component.dart';

enum ShelfComponentType {
  fullTopLeftCorner,
  fullTopRightCorner,
  fullLeftCorner,
  fullRightCorner,
  fullBottomLeftCorner,
  fullBottomRightCorner,

  emptyTopLeftCorner,
  emptyTopRightCorner,
  emptyLeftCorner,
  emptyRightCorner,
  emptyBottomLeftCorner,
  emptyBottomRightCorner,
}

class ShelfComponent extends MyComponent with CollisionCallbacks {
  late final MyGame _game;

  late final Map<ShelfComponentType, Sprite> _types = {
    ShelfComponentType.fullTopLeftCorner: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(7, 12))),
    ShelfComponentType.fullTopRightCorner: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(8, 12))),
    ShelfComponentType.fullLeftCorner: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(7, 13))),
    ShelfComponentType.fullRightCorner: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(8, 13))),
    ShelfComponentType.fullBottomLeftCorner: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(7, 14))),
    ShelfComponentType.fullBottomRightCorner: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(8, 14))),
    ShelfComponentType.emptyTopLeftCorner: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(7, 15))),
    ShelfComponentType.emptyTopRightCorner: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(8, 15))),
    ShelfComponentType.emptyLeftCorner: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(7, 16))),
    ShelfComponentType.emptyRightCorner: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(8, 16))),
    ShelfComponentType.emptyBottomLeftCorner: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(7, 17))),
    ShelfComponentType.emptyBottomRightCorner: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(8, 17))),
  };

  ShelfComponent(MyGame game, ShelfComponentType type, Vector2 position,
      {int priority = 0})
      : super(game, position, priority) {
    _game = game;
    sprite = _types[type];
  }
}
