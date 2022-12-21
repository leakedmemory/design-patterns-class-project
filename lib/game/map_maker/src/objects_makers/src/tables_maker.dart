import '../../../../my_game.dart';
import '../../../map_maker.dart';
import '../../objects_factories/factories.dart';

class TablesMaker implements Maker<TableComponent> {
  late final MyGame _game;
  late final TableFactory _factory;

  TablesMaker(MyGame game) {
    _game = game;
    _factory = TableFactory(game);
  }

  @override
  List<TableComponent> make() {
    _game.logger.log('Gerando mesas');
    final withTurn =
        _factory.createTableWithTurn(tilePositionX: 2, tilePositionY: 6);

    final trophies = _factory.horizontalTable(
        tilePositionX: 2, tilePositionY: 11, length: 5);

    final leftSquared =
        _factory.createSquaredTable(tilePositionX: 8, tilePositionY: 6);

    final rightSquared =
        _factory.createSquaredTable(tilePositionX: 15, tilePositionY: 6);

    final main = _factory.horizontalTable(
        tilePositionX: 14, tilePositionY: 1, length: 5);

    final vertical = _factory.createVerticalTable(
        tilePositionX: 20, tilePositionY: 6, length: 7);

    final coffee =
        _factory.createCoffeeTable(tilePositionX: 2, tilePositionY: 0);

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
