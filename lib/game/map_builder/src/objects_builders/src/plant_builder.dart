import '../../../../my_game.dart';
import '../../../map_builder.dart';
import '../../objects_facades/facades.dart';

class PlantBuilder implements Builder<PlantComponent> {
  late final MyGame _game;
  late final PlantFacade _facade;

  PlantBuilder(MyGame game) {
    _game = game;
    _facade = PlantFacade(game);
  }

  @override
  List<PlantComponent> make() {
    _game.logger.log('Gerando plantas');
    final plantOnTopOfMainTable =
        _facade.createLittlePlant(tilePositionX: 14, tilePositionY: 1);
    final plantAtRightSideOfMainTable =
        _facade.createLittlePlant(tilePositionX: 19, tilePositionY: 1);
    final plantOnVerticalTable =
        _facade.createLittlePlant(tilePositionX: 21, tilePositionY: 12);
    final cactusAtRightSideOfMainTable =
        _facade.createCactus(tilePositionX: 20, tilePositionY: 0);
    final cactusAtTopLeft =
        _facade.createCactus(tilePositionX: 1, tilePositionY: 0);
    final plantAtBottomLeftCorner =
        _facade.createBigPlant(tilePositionX: 0, tilePositionY: 17);
    final plantAtBottomRightCorner =
        _facade.createBigPlant(tilePositionX: 21, tilePositionY: 17);

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
