import 'package:flame/input.dart';

import '../../../../my_game.dart';
import '../../../map_builder.dart';
import 'object_facade.dart';

class PrinterFacade
    implements ObjectFacade<PrinterComponent, PrinterComponentType> {
  late final MyGame _game;
  static const int _defaultPriority = 0;

  PrinterFacade(MyGame game) {
    _game = game;
  }

  @override
  PrinterComponent createSpriteComponent(
      {required PrinterComponentType type,
      required double tilePositionX,
      required double tilePositionY,
      required int priority}) {
    return PrinterComponent(_game, type,
        Vector2(tilePositionX, tilePositionY) * _game.tileSizeInPixels,
        priority: priority);
  }

  List<PrinterComponent> createColoredPrinterWithPC(
      {required double tilePositionX, required double tilePositionY}) {
    List<PrinterComponent> printer = [];
    printer.add(createSpriteComponent(
        type: PrinterComponentType.coloredPrinterWithPCTopLeft,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: _defaultPriority));
    printer.add(createSpriteComponent(
        type: PrinterComponentType.coloredPrinterWithPCBottomLeft,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));
    printer.add(createSpriteComponent(
        type: PrinterComponentType.coloredPrinterWithPCTopMiddle,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY,
        priority: _defaultPriority));
    printer.add(createSpriteComponent(
        type: PrinterComponentType.coloredPrinterWithPCBottomMiddle,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));
    printer.add(createSpriteComponent(
        type: PrinterComponentType.coloredPrinterWithPCTopRight,
        tilePositionX: tilePositionX + 2,
        tilePositionY: tilePositionY,
        priority: _defaultPriority));
    printer.add(createSpriteComponent(
        type: PrinterComponentType.coloredPrinterWithPCBottomRight,
        tilePositionX: tilePositionX + 2,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));

    return printer;
  }

  List<PrinterComponent> verticalPrinter(
      {required double tilePositionX, required double tilePositionY}) {
    List<PrinterComponent> printer = [];
    printer.add(createSpriteComponent(
        type: PrinterComponentType.verticalBlackPrinterTop,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: _defaultPriority));
    printer.add(createSpriteComponent(
        type: PrinterComponentType.verticalBlackPrinterBottom,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));

    return printer;
  }
}
