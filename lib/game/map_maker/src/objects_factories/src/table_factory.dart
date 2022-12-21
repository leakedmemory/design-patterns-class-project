import 'package:flame/components.dart';

import '../../../../my_game.dart';
import '../../../map_maker.dart';
import 'object_factory.dart';

class TableFactory
    implements ObjectFactory<TableComponent, TableComponentType> {
  late final MyGame _game;
  static const int _defaultPriority = 0;

  TableFactory(MyGame game) {
    _game = game;
  }

  @override
  TableComponent createSpriteComponent(
      {required TableComponentType type,
      required double tilePositionX,
      required double tilePositionY,
      required int priority}) {
    return TableComponent(_game, type,
        Vector2(tilePositionX, tilePositionY) * _game.tileSizeInPixels,
        priority: priority);
  }

  List<TableComponent> createTableWithTurn(
      {required double tilePositionX, required double tilePositionY}) {
    List<TableComponent> table = [];
    table.add(createSpriteComponent(
        type: TableComponentType.topLeftCornerTurn,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: 2));
    table.add(createSpriteComponent(
        type: TableComponentType.topCorner,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY,
        priority: 2));
    table.add(createSpriteComponent(
        type: TableComponentType.topCorner,
        tilePositionX: tilePositionX + 2,
        tilePositionY: tilePositionY,
        priority: 2));
    table.add(createSpriteComponent(
        type: TableComponentType.topRightCorner,
        tilePositionX: tilePositionX + 3,
        tilePositionY: tilePositionY,
        priority: 2));

    table.add(createSpriteComponent(
        type: TableComponentType.leftCornerTurn,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));
    table.add(createSpriteComponent(
        type: TableComponentType.center,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));
    table.add(createSpriteComponent(
        type: TableComponentType.center,
        tilePositionX: tilePositionX + 2,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));
    table.add(createSpriteComponent(
        type: TableComponentType.rightCorner,
        tilePositionX: tilePositionX + 3,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));

    table.add(createSpriteComponent(
        type: TableComponentType.turnToRight,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 2,
        priority: _defaultPriority));
    table.add(createSpriteComponent(
        type: TableComponentType.bottomCorner,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY + 2,
        priority: _defaultPriority));
    table.add(createSpriteComponent(
        type: TableComponentType.bottomCorner,
        tilePositionX: tilePositionX + 2,
        tilePositionY: tilePositionY + 2,
        priority: _defaultPriority));
    table.add(createSpriteComponent(
        type: TableComponentType.bottomRightCorner,
        tilePositionX: tilePositionX + 3,
        tilePositionY: tilePositionY + 2,
        priority: _defaultPriority));

    table.add(createSpriteComponent(
        type: TableComponentType.doubleFeet,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 3,
        priority: _defaultPriority));

    return table;
  }

  List<TableComponent> horizontalTable(
      {required double tilePositionX,
      required tilePositionY,
      required int length}) {
    List<TableComponent> table = [];
    table.add(createSpriteComponent(
        type: TableComponentType.topLeftCorner,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: 3));
    table.add(createSpriteComponent(
        type: TableComponentType.bottomLeftCorner,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));

    for (double i = 1; i < length; i++) {
      table.add(createSpriteComponent(
          type: TableComponentType.topCorner,
          tilePositionX: tilePositionX + i,
          tilePositionY: tilePositionY,
          priority: 3));
      table.add(createSpriteComponent(
          type: TableComponentType.bottomCorner,
          tilePositionX: tilePositionX + i,
          tilePositionY: tilePositionY + 1,
          priority: _defaultPriority));
    }

    table.add(createSpriteComponent(
        type: TableComponentType.topRightCorner,
        tilePositionX: tilePositionX + length,
        tilePositionY: tilePositionY,
        priority: 3));
    table.add(createSpriteComponent(
        type: TableComponentType.bottomRightCorner,
        tilePositionX: tilePositionX + length,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));

    return table;
  }

  List<TableComponent> createSquaredTable(
      {required double tilePositionX, required double tilePositionY}) {
    List<TableComponent> table = [];
    table.add(createSpriteComponent(
        type: TableComponentType.topLeftCorner,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: 2));
    table.add(createSpriteComponent(
        type: TableComponentType.topCorner,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY,
        priority: 2));
    table.add(createSpriteComponent(
        type: TableComponentType.topRightCorner,
        tilePositionX: tilePositionX + 2,
        tilePositionY: tilePositionY,
        priority: 2));

    table.add(createSpriteComponent(
        type: TableComponentType.leftCorner,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));
    table.add(createSpriteComponent(
        type: TableComponentType.center,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));
    table.add(createSpriteComponent(
        type: TableComponentType.rightCorner,
        tilePositionX: tilePositionX + 2,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));

    table.add(createSpriteComponent(
        type: TableComponentType.bottomLeftCorner,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 2,
        priority: _defaultPriority));
    table.add(createSpriteComponent(
        type: TableComponentType.bottomCorner,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY + 2,
        priority: _defaultPriority));
    table.add(createSpriteComponent(
        type: TableComponentType.bottomRightCorner,
        tilePositionX: tilePositionX + 2,
        tilePositionY: tilePositionY + 2,
        priority: _defaultPriority));

    return table;
  }

  List<TableComponent> createVerticalTable(
      {required double tilePositionX,
      required double tilePositionY,
      required int length}) {
    List<TableComponent> table = [];
    table.add(createSpriteComponent(
        type: TableComponentType.topLeftCorner,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: 2));
    table.add(createSpriteComponent(
        type: TableComponentType.topRightCorner,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY,
        priority: 2));

    for (int i = 1; i < length; i++) {
      table.add(createSpriteComponent(
          type: TableComponentType.leftCorner,
          tilePositionX: tilePositionX,
          tilePositionY: tilePositionY + i,
          priority: _defaultPriority));
      table.add(createSpriteComponent(
          type: TableComponentType.rightCorner,
          tilePositionX: tilePositionX + 1,
          tilePositionY: tilePositionY + i,
          priority: _defaultPriority));
    }

    table.add(createSpriteComponent(
        type: TableComponentType.bottomLeftCorner,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + length,
        priority: _defaultPriority));
    table.add(createSpriteComponent(
        type: TableComponentType.bottomRightCorner,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY + length,
        priority: _defaultPriority));

    return table;
  }

  List<TableComponent> createCoffeeTable(
      {required double tilePositionX, required double tilePositionY}) {
    List<TableComponent> table = [];
    table.add(createSpriteComponent(
        type: TableComponentType.topLeftCornerCoffee,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: 6));
    table.add(createSpriteComponent(
        type: TableComponentType.topRightCornerCoffee,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY,
        priority: 6));
    table.add(createSpriteComponent(
        type: TableComponentType.middleLeftCornerCoffee,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 1,
        priority: 6));
    table.add(createSpriteComponent(
        type: TableComponentType.middleRightCornerCoffee,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY + 1,
        priority: 6));
    table.add(createSpriteComponent(
        type: TableComponentType.bottomLeftCornerCoffee,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 2,
        priority: _defaultPriority));
    table.add(createSpriteComponent(
        type: TableComponentType.bottomRightCornerCoffee,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY + 2,
        priority: _defaultPriority));

    return table;
  }
}
