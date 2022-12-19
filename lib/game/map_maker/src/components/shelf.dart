import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../../my_game.dart';
import '../abstractions/my_component.dart';

enum ShelfType {
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

class Shelf extends MyComponent with CollisionCallbacks {
  late final MyGame _game;

  late final Map<ShelfType, Sprite> _types = {
    ShelfType.fullTopLeftCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(7, 12)),
    ShelfType.fullTopRightCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(8, 12)),
    ShelfType.fullLeftCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(7, 13)),
    ShelfType.fullRightCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(8, 13)),
    ShelfType.fullBottomLeftCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(7, 14)),
    ShelfType.fullBottomRightCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(8, 14)),
    ShelfType.emptyTopLeftCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(7, 15)),
    ShelfType.emptyTopRightCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(8, 15)),
    ShelfType.emptyLeftCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(7, 16)),
    ShelfType.emptyRightCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(8, 16)),
    ShelfType.emptyBottomLeftCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(7, 17)),
    ShelfType.emptyBottomRightCorner:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(8, 17)),
  };

  Shelf(MyGame game, ShelfType type, Vector2 position, {int priority = 0})
      : super(game, position, priority) {
    _game = game;
    sprite = _types[type];
  }
}
