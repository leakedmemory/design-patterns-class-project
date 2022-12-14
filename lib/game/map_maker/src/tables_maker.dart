import 'package:flame/components.dart';

import '../../my_game.dart';
import 'abstractions/maker.dart';
import 'components/table.dart';

class TablesMaker implements Maker<Table> {
  late final MyGame _game;

  TablesMaker(MyGame game) {
    _game = game;
  }

  Table _setSpriteTileOnMap(TableType type, double x, double y) {
    return Table(_game, type,
        Vector2(_game.tileSizeInPixels * x, _game.tileSizeInPixels * y));
  }

  @override
  List<Table> make() {
    List<Table> tables = [
      ..._tableWithTurn(),
      ..._trophiesTable(),
      ..._squaredTable1(),
      ..._squaredTable2(),
      ..._verticalTable(),
      ..._mainTable(),
      ..._miniTable(),
    ];

    return tables;
  }

  List<Table> _tableWithTurn() {
    List<Table> table = [];
    table.add(_setSpriteTileOnMap(TableType.topLeftCornerTurn, 2, 6));
    table.add(_setSpriteTileOnMap(TableType.topCorner, 3, 6));
    table.add(_setSpriteTileOnMap(TableType.topCorner, 4, 6));
    table.add(_setSpriteTileOnMap(TableType.topRightCorner, 5, 6));

    table.add(_setSpriteTileOnMap(TableType.leftCornerTurn, 2, 7));
    table.add(_setSpriteTileOnMap(TableType.center, 3, 7));
    table.add(_setSpriteTileOnMap(TableType.center, 4, 7));
    table.add(_setSpriteTileOnMap(TableType.rightCorner, 5, 7));

    table.add(_setSpriteTileOnMap(TableType.turnToRight, 2, 8));
    table.add(_setSpriteTileOnMap(TableType.bottomCorner, 3, 8));
    table.add(_setSpriteTileOnMap(TableType.bottomCorner, 4, 8));
    table.add(_setSpriteTileOnMap(TableType.bottomRightCorner, 5, 8));

    table.add(_setSpriteTileOnMap(TableType.doubleFeet, 2, 9));

    return table;
  }

  List<Table> _trophiesTable() {
    List<Table> table = [];
    table.add(_setSpriteTileOnMap(TableType.topLeftCorner, 2, 11));
    table.add(_setSpriteTileOnMap(TableType.bottomLeftCorner, 2, 12));

    for (double i = 3; i <= 5; i++) {
      table.add(_setSpriteTileOnMap(TableType.topCorner, i, 11));
      table.add(_setSpriteTileOnMap(TableType.bottomCorner, i, 12));
    }

    table.add(_setSpriteTileOnMap(TableType.topRightCorner, 6, 11));
    table.add(_setSpriteTileOnMap(TableType.bottomRightCorner, 6, 12));

    return table;
  }

  List<Table> _squaredTable1() {
    List<Table> table = [];
    table.add(_setSpriteTileOnMap(TableType.topLeftCorner, 8, 6));
    table.add(_setSpriteTileOnMap(TableType.topCorner, 9, 6));
    table.add(_setSpriteTileOnMap(TableType.topRightCorner, 10, 6));

    table.add(_setSpriteTileOnMap(TableType.leftCorner, 8, 7));
    table.add(_setSpriteTileOnMap(TableType.center, 9, 7));
    table.add(_setSpriteTileOnMap(TableType.rightCorner, 10, 7));

    table.add(_setSpriteTileOnMap(TableType.bottomLeftCorner, 8, 8));
    table.add(_setSpriteTileOnMap(TableType.bottomCorner, 9, 8));
    table.add(_setSpriteTileOnMap(TableType.bottomRightCorner, 10, 8));

    return table;
  }

  List<Table> _squaredTable2() {
    List<Table> table = [];
    table.add(_setSpriteTileOnMap(TableType.topLeftCorner, 15, 6));
    table.add(_setSpriteTileOnMap(TableType.topCorner, 16, 6));
    table.add(_setSpriteTileOnMap(TableType.topRightCorner, 17, 6));

    table.add(_setSpriteTileOnMap(TableType.leftCorner, 15, 7));
    table.add(_setSpriteTileOnMap(TableType.center, 16, 7));
    table.add(_setSpriteTileOnMap(TableType.rightCorner, 17, 7));

    table.add(_setSpriteTileOnMap(TableType.bottomLeftCorner, 15, 8));
    table.add(_setSpriteTileOnMap(TableType.bottomCorner, 16, 8));
    table.add(_setSpriteTileOnMap(TableType.bottomRightCorner, 17, 8));

    return table;
  }

  List<Table> _verticalTable() {
    List<Table> table = [];
    table.add(_setSpriteTileOnMap(TableType.topLeftCorner, 20, 6));
    table.add(_setSpriteTileOnMap(TableType.topRightCorner, 21, 6));

    for (double y = 7; y < 13; y++) {
      table.add(_setSpriteTileOnMap(TableType.leftCorner, 20, y));
      table.add(_setSpriteTileOnMap(TableType.rightCorner, 21, y));
    }

    table.add(_setSpriteTileOnMap(TableType.bottomLeftCorner, 20, 13));
    table.add(_setSpriteTileOnMap(TableType.bottomRightCorner, 21, 13));

    return table;
  }

  List<Table> _mainTable() {
    List<Table> table = [];
    table.add(_setSpriteTileOnMap(TableType.topLeftCorner, 14, 1));
    table.add(_setSpriteTileOnMap(TableType.bottomLeftCorner, 14, 2));

    for (double x = 15; x < 18; x++) {
      table.add(_setSpriteTileOnMap(TableType.topCorner, x, 1));
      table.add(_setSpriteTileOnMap(TableType.bottomCorner, x, 2));
    }

    table.add(_setSpriteTileOnMap(TableType.topRightCorner, 18, 1));
    table.add(_setSpriteTileOnMap(TableType.bottomRightCorner, 18, 2));

    return table;
  }

  List<Table> _miniTable() {
    List<Table> table = [];
    table.add(_setSpriteTileOnMap(TableType.topLeftCornerCoffee, 2, 0));
    table.add(_setSpriteTileOnMap(TableType.topRightCornerCoffee, 3, 0));
    table.add(_setSpriteTileOnMap(TableType.middleLeftCornerCoffee, 2, 1));
    table.add(_setSpriteTileOnMap(TableType.middleRightCornerCoffee, 3, 1));
    table.add(_setSpriteTileOnMap(TableType.bottomLeftCornerCoffee, 2, 2));
    table.add(_setSpriteTileOnMap(TableType.bottomRightCornerCoffee, 3, 2));

    return table;
  }
}
