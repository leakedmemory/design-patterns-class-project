import 'package:flame/input.dart';

import '../../../../my_game.dart';
import '../../../map_maker.dart';
import 'object_factory.dart';

class ChairFactory
    implements ObjectFactory<ChairComponent, ChairComponentType> {
  late final MyGame _game;
  static const int _defaultPriority = 0;

  ChairFactory(MyGame game) {
    _game = game;
  }

  @override
  ChairComponent createSpriteComponent(
      {required ChairComponentType type,
      required double tilePositionX,
      required double tilePositionY,
      required int priority}) {
    return ChairComponent(_game, type,
        Vector2(tilePositionX, tilePositionY) * _game.tileSizeInPixels,
        priority: priority);
  }

  List<ChairComponent> createBackwardsChair({
    required double tilePositionX,
    required double tilePositionY,
  }) {
    List<ChairComponent> chair = [];
    chair.add(createSpriteComponent(
        type: ChairComponentType.brownUpTop,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: _defaultPriority));
    chair.add(createSpriteComponent(
        type: ChairComponentType.brownUpBottom,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));

    return chair;
  }
}
