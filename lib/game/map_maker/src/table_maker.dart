import 'package:flame/components.dart';

import '../../my_game.dart';
import 'abstractions/maker.dart';
import 'components/table.dart';

class TableMaker implements Maker<Table> {
  late final MyGame _game;

  TableMaker(MyGame game) {
    _game = game;
  }

  @override
  List<Table> make() {
    List<Table> tables = [
      ..._tableWithTurn(),
      ..._longTable(),
    ];

    return tables;
  }

  List<Table> _tableWithTurn() {
    List<Table> table = [];
    table.add(Table(
        _game, 'double_feet', Vector2(_game.tileSize * 2, _game.tileSize * 9)));
    table.add(Table(_game, 'turn_to_right',
        Vector2(_game.tileSize * 2, _game.tileSize * 8)));
    table.add(Table(_game, 'left_above_turn',
        Vector2(_game.tileSize * 2, _game.tileSize * 7)));
    table.add(Table(_game, 'left_corner_turn',
        Vector2(_game.tileSize * 2, _game.tileSize * 6)));
    table.add(Table(_game, 'bottom_corner',
        Vector2(_game.tileSize * 3, _game.tileSize * 8)));
    table.add(Table(_game, 'bottom_corner',
        Vector2(_game.tileSize * 4, _game.tileSize * 8)));
    table.add(Table(_game, 'bottom_right_corner_turn',
        Vector2(_game.tileSize * 5, _game.tileSize * 8)));
    table.add(Table(
        _game, 'center', Vector2(_game.tileSize * 3, _game.tileSize * 7)));
    table.add(Table(
        _game, 'center', Vector2(_game.tileSize * 4, _game.tileSize * 7)));
    table.add(Table(_game, 'right_corner',
        Vector2(_game.tileSize * 5, _game.tileSize * 7)));
    table.add(Table(
        _game, 'top_corner', Vector2(_game.tileSize * 3, _game.tileSize * 6)));
    table.add(Table(
        _game, 'top_corner', Vector2(_game.tileSize * 4, _game.tileSize * 6)));
    table.add(Table(_game, 'top_right_corner_turn',
        Vector2(_game.tileSize * 5, _game.tileSize * 6)));

    return table;
  }

  List<Table> _longTable() {
    List<Table> table = [];
    table.add(Table(_game, 'bottom_left_corner',
        Vector2(_game.tileSize * 2, _game.tileSize * 12)));
    table.add(Table(_game, 'top_left_corner',
        Vector2(_game.tileSize * 2, _game.tileSize * 11)));
    for (double i = 1; i <= 7; i++) {
      final x = _game.tileSize * 2 + _game.tileSize * i;
      table.add(Table(_game, 'bottom_corner', Vector2(x, _game.tileSize * 12)));
      table.add(Table(_game, 'top_corner', Vector2(x, _game.tileSize * 11)));
    }
    table.add(Table(_game, 'top_right_corner',
        Vector2(_game.tileSize * 10, _game.tileSize * 11)));
    table.add(Table(_game, 'bottom_right_corner',
        Vector2(_game.tileSize * 10, _game.tileSize * 12)));

    return table;
  }
}
