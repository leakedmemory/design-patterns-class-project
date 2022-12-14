import 'package:flame/components.dart';

import 'abstractions/maker.dart';
import '../../my_game.dart';
import 'table_maker.dart';
import 'wall_maker.dart';

class MapMaker implements Maker<Component> {
  late final Maker _tableMaker;
  late final Maker _wallMaker;

  MapMaker(MyGame game) {
    _wallMaker = WallMaker(game);
    _tableMaker = TableMaker(game);
  }

  @override
  List<Component> make() {
    List<Component> components = [
      ..._wallMaker.make(),
      ..._tableMaker.make(),
    ];

    return components;
  }
}
