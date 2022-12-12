import 'package:flame/components.dart';

import 'abstractions/maker.dart';
import '../../my_game.dart';
import 'wall_maker.dart';

class MapMaker implements Maker<Component> {
  late final Maker _wallMaker;

  MapMaker(MyGame game) {
    _wallMaker = WallMaker(game);
  }

  @override
  List<Component> make() {
    List<Component> components = [
      ..._wallMaker.make(),
    ];

    return components;
  }
}
