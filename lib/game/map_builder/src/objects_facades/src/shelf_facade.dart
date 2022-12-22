import 'package:flame/components.dart';

import '../../../../my_game.dart';
import '../../../map_builder.dart';
import 'object_facade.dart';

class ShelfFacade implements ObjectFacade<ShelfComponent, ShelfComponentType> {
  late final MyGame _game;
  static const int _defaultPriority = 6;

  ShelfFacade(MyGame game) {
    _game = game;
  }

  @override
  ShelfComponent createSpriteComponent(
      {required ShelfComponentType type,
      required double tilePositionX,
      required double tilePositionY,
      required int priority}) {
    return ShelfComponent(_game, type,
        Vector2(tilePositionX, tilePositionY) * _game.tileSizeInPixels,
        priority: priority);
  }

  List<ShelfComponent> createFullShelf(
      {required double tilePositionX, required double tilePositionY}) {
    List<ShelfComponent> shelf = [];
    shelf.add(createSpriteComponent(
        type: ShelfComponentType.fullTopLeftCorner,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: _defaultPriority));
    shelf.add(createSpriteComponent(
        type: ShelfComponentType.fullTopRightCorner,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY,
        priority: _defaultPriority));
    shelf.add(createSpriteComponent(
        type: ShelfComponentType.fullLeftCorner,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));
    shelf.add(createSpriteComponent(
        type: ShelfComponentType.fullRightCorner,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));
    shelf.add(createSpriteComponent(
        type: ShelfComponentType.fullBottomLeftCorner,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 2,
        priority: _defaultPriority));
    shelf.add(createSpriteComponent(
        type: ShelfComponentType.fullBottomRightCorner,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY + 2,
        priority: _defaultPriority));

    return shelf;
  }

  List<ShelfComponent> createEmptyShelf(
      {required double tilePositionX, required double tilePositionY}) {
    List<ShelfComponent> shelf = [];
    shelf.add(createSpriteComponent(
        type: ShelfComponentType.emptyTopLeftCorner,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: _defaultPriority));
    shelf.add(createSpriteComponent(
        type: ShelfComponentType.emptyTopRightCorner,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY,
        priority: _defaultPriority));
    shelf.add(createSpriteComponent(
        type: ShelfComponentType.emptyLeftCorner,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));
    shelf.add(createSpriteComponent(
        type: ShelfComponentType.emptyRightCorner,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));
    shelf.add(createSpriteComponent(
        type: ShelfComponentType.emptyBottomLeftCorner,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 2,
        priority: _defaultPriority));
    shelf.add(createSpriteComponent(
        type: ShelfComponentType.emptyBottomRightCorner,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY + 2,
        priority: _defaultPriority));

    return shelf;
  }
}
