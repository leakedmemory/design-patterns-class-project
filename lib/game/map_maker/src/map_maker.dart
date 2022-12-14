import 'package:flame/components.dart';

import 'abstractions/maker.dart';
import '../../my_game.dart';
import 'computers_maker.dart';
import 'tables_maker.dart';
import 'walls_maker.dart';

class MapMaker implements Maker<Component> {
  late final Maker _tablesMaker;
  late final Maker _wallsMaker;
  late final Maker _computersMaker;

  MapMaker(MyGame game) {
    _wallsMaker = WallsMaker(game);
    _tablesMaker = TablesMaker(game);
    _computersMaker = ComputersMaker(game);
  }

  @override
  List<Component> make() {
    List<Component> components = [
      ..._wallsMaker.make(),
      ..._tablesMaker.make(),
      ..._computersMaker.make(),
    ];

    return components;
  }
}
