import 'package:flame/components.dart';

import '../../my_game.dart';
import 'abstractions/maker.dart';
import 'computers_maker.dart';
import 'plants_maker.dart';
import 'printers_maker.dart';
import 'shelves_maker.dart';
import 'tables_maker.dart';
import 'walls_maker.dart';

class MapMaker implements Maker<Component> {
  late final Maker _tablesMaker;
  late final Maker _wallsMaker;
  late final Maker _computersMaker;
  late final Maker _printersMaker;
  late final Maker _plantsMaker;
  late final Maker _shelvesMaker;

  MapMaker(MyGame game) {
    _wallsMaker = WallsMaker(game);
    _tablesMaker = TablesMaker(game);
    _computersMaker = ComputersMaker(game);
    _printersMaker = PrintersMaker(game);
    _plantsMaker = PlantsMaker(game);
    _shelvesMaker = ShelvesMaker(game);
  }

  @override
  List<Component> make() {
    List<Component> components = [
      ..._wallsMaker.make(),
      ..._tablesMaker.make(),
      ..._computersMaker.make(),
      ..._printersMaker.make(),
      ..._plantsMaker.make(),
      ..._shelvesMaker.make(),
    ];

    return components;
  }
}
