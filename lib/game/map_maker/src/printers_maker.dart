import 'package:flame/input.dart';

import '../../my_game.dart';
import 'abstractions/component_maker.dart';
import 'components/printer.dart';

class PrintersMaker implements ComponentMaker<Printer, PrinterType> {
  late final MyGame _game;

  PrintersMaker(MyGame game) {
    _game = game;
  }

  @override
  Printer setSpriteTileOnMap(PrinterType type, double x, double y,
      {int priority = 0}) {
    return Printer(_game, type,
        Vector2(_game.tileSizeInPixels * x, _game.tileSizeInPixels * y),
        priority: priority);
  }

  @override
  List<Printer> make() {
    _game.logger.log('Gerando impressoras');
    List<Printer> printers = [
      ..._coloredPrinter(),
      ..._verticalPrinter(),
    ];

    return printers;
  }

  List<Printer> _coloredPrinter() {
    List<Printer> printer = [];
    printer
        .add(setSpriteTileOnMap(PrinterType.coloredPrinterWithPCTopLeft, 8, 7));
    printer.add(
        setSpriteTileOnMap(PrinterType.coloredPrinterWithPCBottomLeft, 8, 8));
    printer.add(
        setSpriteTileOnMap(PrinterType.coloredPrinterWithPCTopMiddle, 9, 7));
    printer.add(
        setSpriteTileOnMap(PrinterType.coloredPrinterWithPCBottomMiddle, 9, 8));
    printer.add(
        setSpriteTileOnMap(PrinterType.coloredPrinterWithPCTopRight, 10, 7));
    printer.add(
        setSpriteTileOnMap(PrinterType.coloredPrinterWithPCBottomRight, 10, 8));

    return printer;
  }

  List<Printer> _verticalPrinter() {
    List<Printer> printer = [];
    printer.add(setSpriteTileOnMap(PrinterType.verticalBlackPrinterTop, 21, 7));
    printer
        .add(setSpriteTileOnMap(PrinterType.verticalBlackPrinterBottom, 21, 8));

    return printer;
  }
}
