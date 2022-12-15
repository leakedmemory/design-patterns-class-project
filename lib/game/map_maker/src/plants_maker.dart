import 'package:flame/input.dart';

import '../../my_game.dart';
import 'abstractions/component_maker.dart';
import 'components/plant.dart';

class PlantsMaker implements ComponentMaker<Plant, PlantType> {
  late final MyGame _game;

  PlantsMaker(MyGame game) {
    _game = game;
  }

  @override
  Plant setSpriteTileOnMap(PlantType type, double x, double y,
      {int priority = 0}) {
    return Plant(_game, type,
        Vector2(_game.tileSizeInPixels * x, _game.tileSizeInPixels * y),
        priority: priority);
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
    plant.add(setSpriteTileOnMap(PlantType.littlePlantTop, 14, 1));
    plant.add(setSpriteTileOnMap(PlantType.littlePlantBottom, 14, 2));

    return plant;
  }

  List<Plant> _plantOnRightSideOfMainTable() {
    List<Plant> plant = [];
    plant.add(setSpriteTileOnMap(PlantType.littlePlantTop, 19, 1));
    plant.add(setSpriteTileOnMap(PlantType.littlePlantBottom, 19, 2));

    return plant;
  }

  List<Plant> _plantOnVerticalTable() {
    List<Plant> plant = [];
    plant
        .add(setSpriteTileOnMap(PlantType.littlePlantTop, 21, 12, priority: 1));
    plant.add(
        setSpriteTileOnMap(PlantType.littlePlantBottom, 21, 13, priority: 1));

    return plant;
  }

  List<Plant> _cactusOnRightSideOfMainTable() {
    List<Plant> plant = [];
    plant.add(setSpriteTileOnMap(PlantType.cactusTop, 20, 0));
    plant.add(setSpriteTileOnMap(PlantType.cactusMiddle, 20, 1));
    plant.add(setSpriteTileOnMap(PlantType.cactusBottom, 20, 2));

    return plant;
  }

  List<Plant> _plantAtBottomLeftCorner() {
    List<Plant> plant = [];
    plant.add(setSpriteTileOnMap(PlantType.bigPlantTop, 0, 17, priority: 2));
    plant.add(setSpriteTileOnMap(PlantType.bigPlantMiddle, 0, 18, priority: 2));
    plant.add(setSpriteTileOnMap(PlantType.bigPlantBottom, 0, 19));

    return plant;
  }

  List<Plant> _plantAtBottomRightCorner() {
    List<Plant> plant = [];
    plant.add(setSpriteTileOnMap(PlantType.bigPlantTop, 21, 17, priority: 2));
    plant
        .add(setSpriteTileOnMap(PlantType.bigPlantMiddle, 21, 18, priority: 2));
    plant.add(setSpriteTileOnMap(PlantType.bigPlantBottom, 21, 19));

    return plant;
  }
}
