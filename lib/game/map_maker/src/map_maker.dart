import 'package:flame/components.dart';

import '../../my_game.dart';
import 'maker.dart';
import 'objects_makers/makers.dart';

class MapMaker implements Maker<Component> {
  late final MyGame _game;

  late final Maker _tablesMaker;
  late final Maker _wallsMaker;
  late final Maker _computersMaker;
  late final Maker _printersMaker;
  late final Maker _plantsMaker;
  late final Maker _shelvesMaker;
  late final Maker _chairsMaker;
  late final Maker _boardsMaker;

  MapMaker(MyGame game) {
    _game = game;

    _wallsMaker = WallsMaker(game);
    _tablesMaker = TablesMaker(game);
    _computersMaker = MonitorsMakers(game);
    _printersMaker = PrintersMaker(game);
    _plantsMaker = PlantsMaker(game);
    _shelvesMaker = ShelvesMaker(game);
    _chairsMaker = ChairsMaker(game);
    _boardsMaker = BoardsMaker(game);
  }

  @override
  List<Component> make() {
    _game.logger.log('Gerando mapa');
    List<Component> components = [
      ..._wallsMaker.make(),
      ..._tablesMaker.make(),
      ..._computersMaker.make(),
      ..._printersMaker.make(),
      ..._plantsMaker.make(),
      ..._shelvesMaker.make(),
      ..._chairsMaker.make(),
      ..._boardsMaker.make(),
    ];

    return components;
  }
}
