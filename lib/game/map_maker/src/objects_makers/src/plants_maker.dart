import '../../../../my_game.dart';
import '../../../map_maker.dart';
import '../../objects_factories/factories.dart';

class PlantsMaker implements Maker<PlantComponent> {
  late final MyGame _game;
  late final PlantFactory _factory;

  PlantsMaker(MyGame game) {
    _game = game;
    _factory = PlantFactory(game);
  }

  @override
  List<PlantComponent> make() {
    _game.logger.log('Gerando plantas');
    final plantOnTopOfMainTable =
        _factory.createLittlePlant(tilePositionX: 14, tilePositionY: 1);
    final plantAtRightSideOfMainTable =
        _factory.createLittlePlant(tilePositionX: 19, tilePositionY: 1);
    final plantOnVerticalTable =
        _factory.createLittlePlant(tilePositionX: 21, tilePositionY: 12);
    final cactusAtRightSideOfMainTable =
        _factory.createCactus(tilePositionX: 20, tilePositionY: 0);
    final cactusAtTopLeft =
        _factory.createCactus(tilePositionX: 1, tilePositionY: 0);
    final plantAtBottomLeftCorner =
        _factory.createBigPlant(tilePositionX: 0, tilePositionY: 17);
    final plantAtBottomRightCorner =
        _factory.createBigPlant(tilePositionX: 21, tilePositionY: 17);

    return [
      ...plantOnTopOfMainTable,
      ...plantAtRightSideOfMainTable,
      ...plantOnVerticalTable,
      ...cactusAtRightSideOfMainTable,
      ...cactusAtTopLeft,
      ...plantAtBottomLeftCorner,
      ...plantAtBottomRightCorner,
    ];
  }
}
