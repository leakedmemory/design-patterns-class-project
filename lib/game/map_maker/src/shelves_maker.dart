import 'package:flame/components.dart';

import '../../my_game.dart';
import 'abstractions/component_maker.dart';
import 'components/shelf.dart';

class ShelvesMaker implements ComponentMaker<Shelf, ShelfType> {
  late final MyGame _game;

  ShelvesMaker(MyGame game) {
    _game = game;
  }

  @override
  Shelf setSpriteTileOnMap(ShelfType type, double x, double y,
      {int priority = 0}) {
    return Shelf(_game, type,
        Vector2(_game.tileSizeInPixels * x, _game.tileSizeInPixels * y),
        priority: priority);
  }

  @override
  List<Shelf> make() {
    List<Shelf> shelves = [
      ..._createFullShelf(),
      ..._createEmptyShelf(),
    ];

    return shelves;
  }

  List<Shelf> _createFullShelf() {
    List<Shelf> shelf = [];
    shelf.add(
        setSpriteTileOnMap(ShelfType.fullTopLeftCorner, 5, 0, priority: 6));
    shelf.add(
        setSpriteTileOnMap(ShelfType.fullTopRightCorner, 6, 0, priority: 6));
    shelf.add(setSpriteTileOnMap(ShelfType.fullLeftCorner, 5, 1, priority: 6));
    shelf.add(setSpriteTileOnMap(ShelfType.fullRightCorner, 6, 1, priority: 6));
    shelf.add(
        setSpriteTileOnMap(ShelfType.fullBottomLeftCorner, 5, 2, priority: 6));
    shelf.add(
        setSpriteTileOnMap(ShelfType.fullBottomRightCorner, 6, 2, priority: 6));

    return shelf;
  }

  List<Shelf> _createEmptyShelf() {
    List<Shelf> shelf = [];
    shelf.add(
        setSpriteTileOnMap(ShelfType.emptyTopLeftCorner, 7, 0, priority: 6));
    shelf.add(
        setSpriteTileOnMap(ShelfType.emptyTopRightCorner, 8, 0, priority: 6));
    shelf.add(setSpriteTileOnMap(ShelfType.emptyLeftCorner, 7, 1, priority: 6));
    shelf
        .add(setSpriteTileOnMap(ShelfType.emptyRightCorner, 8, 1, priority: 6));
    shelf.add(
        setSpriteTileOnMap(ShelfType.emptyBottomLeftCorner, 7, 2, priority: 6));
    shelf.add(setSpriteTileOnMap(ShelfType.emptyBottomRightCorner, 8, 2,
        priority: 6));

    return shelf;
  }
}
