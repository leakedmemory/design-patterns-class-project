import 'package:flame/input.dart';

import '../../../../my_game.dart';
import 'object_facade.dart';
import '../../components/components.dart';

class PlantFacade implements ObjectFacade<PlantComponent, PlantComponentType> {
  late final MyGame _game;
  static const int _defaultPriority = 0;

  PlantFacade(MyGame game) {
    _game = game;
  }

  @override
  PlantComponent createSpriteComponent(
      {required PlantComponentType type,
      required double tilePositionX,
      required double tilePositionY,
      required int priority}) {
    return PlantComponent(_game, type,
        Vector2(tilePositionX, tilePositionY) * _game.tileSizeInPixels,
        priority: priority);
  }

  List<PlantComponent> createLittlePlant({
    required double tilePositionX,
    required double tilePositionY,
  }) {
    List<PlantComponent> plant = [];
    plant.add(createSpriteComponent(
        type: PlantComponentType.littlePlantTop,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: 4));
    plant.add(createSpriteComponent(
        type: PlantComponentType.littlePlantBottom,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));

    return plant;
  }

  List<PlantComponent> createCactus({
    required double tilePositionX,
    required double tilePositionY,
  }) {
    List<PlantComponent> plant = [];
    plant.add(createSpriteComponent(
        type: PlantComponentType.cactusTop,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: 6));
    plant.add(createSpriteComponent(
        type: PlantComponentType.cactusMiddle,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 1,
        priority: 6));
    plant.add(createSpriteComponent(
        type: PlantComponentType.cactusBottom,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 2,
        priority: _defaultPriority));

    return plant;
  }

  List<PlantComponent> createBigPlant({
    required double tilePositionX,
    required double tilePositionY,
  }) {
    List<PlantComponent> plant = [];
    plant.add(createSpriteComponent(
        type: PlantComponentType.bigPlantTop,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: 2));
    plant.add(createSpriteComponent(
        type: PlantComponentType.bigPlantMiddle,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 1,
        priority: 2));
    plant.add(createSpriteComponent(
        type: PlantComponentType.bigPlantBottom,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 2,
        priority: _defaultPriority));

    return plant;
  }
}
