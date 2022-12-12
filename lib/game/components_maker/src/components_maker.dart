import 'package:flame/components.dart';

import 'wall_maker.dart';
import '../../utils/maker.dart';
import '../../my_game.dart';

class ComponentsMaker implements Maker<Component> {
  late final WallMaker _wallMaker;

  ComponentsMaker(MyGame game) {
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
