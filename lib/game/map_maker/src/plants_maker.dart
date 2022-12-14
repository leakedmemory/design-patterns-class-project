import 'package:flame/input.dart';

import '../../my_game.dart';
import 'abstractions/maker.dart';
import 'components/plant.dart';

class PlantsMaker implements Maker<Plant> {
  late final MyGame _game;

  PlantsMaker(MyGame game) {
    _game = game;
  }

  Plant _setSpriteTileOnMap(PlantType type, double x, double y) {
    return Plant(_game, type,
        Vector2(_game.tileSizeInPixels * x, _game.tileSizeInPixels * y));
  }

  @override
  List<Plant> make() {
    List<Plant> plants = [
      ..._plantOnTopOfMainTable(),
      ..._plantOnRightSideOfMainTable(),
      ..._plantOnVerticalTable(),
      ..._cactusOnRightSideOfMainTable(),
      ..._plantAtBottomLeftCorner(),
      ..._plantAtBottomRightCorner(),
    ];

    return plants;
  }

  List<Plant> _plantOnTopOfMainTable() {
    List<Plant> plant = [];
    plant.add(_setSpriteTileOnMap(PlantType.littlePlantTop, 14, 1));
    plant.add(_setSpriteTileOnMap(PlantType.littlePlantBottom, 14, 2));

    return plant;
  }

  List<Plant> _plantOnRightSideOfMainTable() {
    List<Plant> plant = [];
    plant.add(_setSpriteTileOnMap(PlantType.littlePlantTop, 19, 1));
    plant.add(_setSpriteTileOnMap(PlantType.littlePlantBottom, 19, 2));

    return plant;
  }

  List<Plant> _plantOnVerticalTable() {
    List<Plant> plant = [];
    plant.add(_setSpriteTileOnMap(PlantType.littlePlantTop, 21, 12));
    plant.add(_setSpriteTileOnMap(PlantType.littlePlantBottom, 21, 13));

    return plant;
  }

  List<Plant> _cactusOnRightSideOfMainTable() {
    List<Plant> plant = [];
    plant.add(_setSpriteTileOnMap(PlantType.cactusTop, 20, 0));
    plant.add(_setSpriteTileOnMap(PlantType.cactusMiddle, 20, 1));
    plant.add(_setSpriteTileOnMap(PlantType.cactusBottom, 20, 2));

    return plant;
  }

  List<Plant> _plantAtBottomLeftCorner() {
    List<Plant> plant = [];
    plant.add(_setSpriteTileOnMap(PlantType.bigPlantTop, 0, 17));
    plant.add(_setSpriteTileOnMap(PlantType.bigPlantMiddle, 0, 18));
    plant.add(_setSpriteTileOnMap(PlantType.bigPlantBottom, 0, 19));

    return plant;
  }

  List<Plant> _plantAtBottomRightCorner() {
    List<Plant> plant = [];
    plant.add(_setSpriteTileOnMap(PlantType.bigPlantTop, 21, 17));
    plant.add(_setSpriteTileOnMap(PlantType.bigPlantMiddle, 21, 18));
    plant.add(_setSpriteTileOnMap(PlantType.bigPlantBottom, 21, 19));

    return plant;
  }
}
