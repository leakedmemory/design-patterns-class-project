import 'package:flame/components.dart';

import '../../my_game.dart';
import 'abstractions/maker.dart';
import 'components/table.dart';

class TableMaker implements Maker<Table> {
  late final MyGame _game;

  TableMaker(MyGame game) {
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
    ];

    return tables;
  }

  List<Table> _tableWithTurn() {
    List<Table> table = [];
    table.add(_setSpriteTileOnMap(TableType.doubleFeet, 2, 9));
    table.add(_setSpriteTileOnMap(TableType.turnToRight, 2, 8));
    table.add(_setSpriteTileOnMap(TableType.leftAboveTurn, 2, 7));
    table.add(_setSpriteTileOnMap(TableType.leftCornerTurn, 2, 6));
    table.add(_setSpriteTileOnMap(TableType.bottomCorner, 3, 8));
    table.add(_setSpriteTileOnMap(TableType.bottomCorner, 4, 8));
    table.add(_setSpriteTileOnMap(TableType.bottomRightCornerTurn, 5, 8));
    table.add(_setSpriteTileOnMap(TableType.center, 3, 7));
    table.add(_setSpriteTileOnMap(TableType.center, 4, 7));
    table.add(_setSpriteTileOnMap(TableType.rightCorner, 5, 7));
    table.add(_setSpriteTileOnMap(TableType.topCorner, 3, 6));
    table.add(_setSpriteTileOnMap(TableType.topCorner, 4, 6));
    table.add(_setSpriteTileOnMap(TableType.topRightCornerTurn, 5, 6));

    return table;
  }

  List<Table> _trophiesTable() {
    List<Table> table = [];
    table.add(_setSpriteTileOnMap(TableType.bottomLeftCorner, 2, 12));
    table.add(_setSpriteTileOnMap(TableType.topLeftCorner, 2, 11));
    for (double i = 3; i <= 5; i++) {
      table.add(_setSpriteTileOnMap(TableType.bottomCorner, i, 12));
      table.add(_setSpriteTileOnMap(TableType.topCorner, i, 11));
    }
    table.add(_setSpriteTileOnMap(TableType.topRightCorner, 6, 11));
    table.add(_setSpriteTileOnMap(TableType.bottomRightCorner, 6, 12));

    return table;
  }

  List<Table> _squaredTable1() {
    List<Table> table = [];

    return table;
  }

  List<Table> _squaredTable2() {
    List<Table> table = [];

    return table;
  }

  List<Table> _verticalTable() {
    List<Table> table = [];

    return table;
  }

  List<Table> _mainTable() {
    List<Table> table = [];

    return table;
  }
}
