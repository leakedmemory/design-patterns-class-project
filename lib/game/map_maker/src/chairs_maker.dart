import 'package:flame/input.dart';

import '../../my_game.dart';
import 'abstractions/component_maker.dart';
import 'components/chair.dart';

class ChairsMaker implements ComponentMaker<Chair, ChairType> {
  late final MyGame _game;

  ChairsMaker(MyGame game) {
    _game = game;
  }

  @override
  Chair setSpriteTileOnMap(ChairType type, double x, double y,
      {int priority = 0}) {
    return Chair(_game, type,
        Vector2(_game.tileSizeInPixels * x, _game.tileSizeInPixels * y),
        priority: priority);
  }

  @override
  List<Chair> make() {
    _game.logger.log('Gerando cadeiras');
    List<Chair> chairs = [
      ..._createMainTableChair(),
    ];

    return chairs;
  }

  List<Chair> _createMainTableChair() {
    List<Chair> chair = [];
    chair.add(setSpriteTileOnMap(ChairType.brownUpTop, 16, 2));
    chair.add(setSpriteTileOnMap(ChairType.brownUpBottom, 16, 3));

    return chair;
  }
}
