import '../../../../my_game.dart';
import '../../../map_maker.dart';
import '../../objects_factories/factories.dart';

class PrintersMaker implements Maker<PrinterComponent> {
  late final MyGame _game;
  late final PrinterFactory _factory;

  PrintersMaker(MyGame game) {
    _game = game;
    _factory = PrinterFactory(game);
  }

  @override
  List<PrinterComponent> make() {
    _game.logger.log('Gerando impressoras');
    final squared1Printer =
        _factory.createColoredPrinterWithPC(tilePositionX: 8, tilePositionY: 7);

    final verticalTablePrinter =
        _factory.verticalPrinter(tilePositionX: 21, tilePositionY: 7);

    return [
      ...squared1Printer,
      ...verticalTablePrinter,
    ];
  }
}
