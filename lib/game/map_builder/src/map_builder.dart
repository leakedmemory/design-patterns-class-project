import 'package:flame/components.dart';

import '../../my_game.dart';
import 'builder.dart';
import 'objects_builders/builders.dart';

class MapBuilder implements Builder<Component> {
  late final MyGame _game;

  late final Builder _tableBuilder;
  late final Builder _wallBuilder;
  late final Builder _computerBuilder;
  late final Builder _printerBuilder;
  late final Builder _plantBuilder;
  late final Builder _shelfBuilder;
  late final Builder _chairBuilder;
  late final Builder _boardBuilder;

  MapBuilder(MyGame game) {
    _game = game;

    _wallBuilder = WallBuilder(game);
    _tableBuilder = TableBuilder(game);
    _computerBuilder = MonitorBuilder(game);
    _printerBuilder = PrinterBuilder(game);
    _plantBuilder = PlantBuilder(game);
    _shelfBuilder = ShelfBuilder(game);
    _chairBuilder = ChairBuilder(game);
    _boardBuilder = BoardBuilder(game);
  }

  @override
  List<Component> make() {
    _game.logger.log('Gerando mapa');
    List<Component> components = [
      ..._wallBuilder.make(),
      ..._tableBuilder.make(),
      ..._computerBuilder.make(),
      ..._printerBuilder.make(),
      ..._plantBuilder.make(),
      ..._shelfBuilder.make(),
      ..._chairBuilder.make(),
      ..._boardBuilder.make(),
    ];

    return components;
  }
}
