import '../../../../my_game.dart';
import '../../../map_builder.dart';
import '../../objects_facades/facades.dart';

class TableBuilder implements Builder<TableComponent> {
  late final MyGame _game;
  late final TableFacade _facade;

  TableBuilder(MyGame game) {
    _game = game;
    _facade = TableFacade(game);
  }

  @override
  List<TableComponent> make() {
    _game.logger.log('Gerando mesas');
    final withTurn =
        _facade.createTableWithTurn(tilePositionX: 2, tilePositionY: 6);

    final trophies =
        _facade.horizontalTable(tilePositionX: 2, tilePositionY: 11, length: 5);

    final leftSquared =
        _facade.createSquaredTable(tilePositionX: 8, tilePositionY: 6);

    final rightSquared =
        _facade.createSquaredTable(tilePositionX: 15, tilePositionY: 6);

    final main =
        _facade.horizontalTable(tilePositionX: 14, tilePositionY: 1, length: 5);

    final vertical = _facade.createVerticalTable(
        tilePositionX: 20, tilePositionY: 6, length: 7);

    final coffee =
        _facade.createCoffeeTable(tilePositionX: 2, tilePositionY: 0);

    return [
      ...withTurn,
      ...trophies,
      ...leftSquared,
      ...rightSquared,
      ...main,
      ...vertical,
      ...coffee,
    ];
  }
}
