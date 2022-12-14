import 'package:flame/input.dart';

import '../../my_game.dart';
import 'abstractions/maker.dart';
import 'components/printer.dart';

class PrintersMaker implements Maker<Printer> {
  late final MyGame _game;

  PrintersMaker(MyGame game) {
    _game = game;
  }

  Printer _setSpriteTileOnMap(PrinterType type, double x, double y) {
    return Printer(_game, type,
        Vector2(_game.tileSizeInPixels * x, _game.tileSizeInPixels * y));
  }

  @override
  List<Printer> make() {
    List<Printer> printers = [
      ..._coloredPrinter(),
      ..._verticalPrinter(),
    ];

    return printers;
  }

  List<Printer> _coloredPrinter() {
    List<Printer> printer = [];
    printer.add(
        _setSpriteTileOnMap(PrinterType.coloredPrinterWithPCTopLeft, 8, 7));
    printer.add(
        _setSpriteTileOnMap(PrinterType.coloredPrinterWithPCBottomLeft, 8, 8));
    printer.add(
        _setSpriteTileOnMap(PrinterType.coloredPrinterWithPCTopMiddle, 9, 7));
    printer.add(_setSpriteTileOnMap(
        PrinterType.coloredPrinterWithPCBottomMiddle, 9, 8));
    printer.add(
        _setSpriteTileOnMap(PrinterType.coloredPrinterWithPCTopRight, 10, 7));
    printer.add(_setSpriteTileOnMap(
        PrinterType.coloredPrinterWithPCBottomRight, 10, 8));

    return printer;
  }

  List<Printer> _verticalPrinter() {
    List<Printer> printer = [];
    printer
        .add(_setSpriteTileOnMap(PrinterType.verticalBlackPrinterTop, 21, 7));
    printer.add(
        _setSpriteTileOnMap(PrinterType.verticalBlackPrinterBottom, 21, 8));

    return printer;
  }
}
