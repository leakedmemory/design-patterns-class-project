import '../../../../my_game.dart';
import '../../../map_builder.dart';
import '../../objects_facades/facades.dart';

class PrinterBuilder implements Builder<PrinterComponent> {
  late final MyGame _game;
  late final PrinterFacade _facade;

  PrinterBuilder(MyGame game) {
    _game = game;
    _facade = PrinterFacade(game);
  }

  @override
  List<PrinterComponent> make() {
    _game.logger.log('Gerando impressoras');
    final squared1Printer =
        _facade.createColoredPrinterWithPC(tilePositionX: 8, tilePositionY: 7);

    final verticalTablePrinter =
        _facade.verticalPrinter(tilePositionX: 21, tilePositionY: 7);

    return [
      ...squared1Printer,
      ...verticalTablePrinter,
    ];
  }
}
