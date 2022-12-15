import 'package:flame/input.dart';
import 'package:flame/widgets.dart';

import '../../../my_game.dart';
import '../abstractions/my_component.dart';

enum PrinterType {
  coloredPrinterWithPCTopLeft,
  coloredPrinterWithPCBottomLeft,
  coloredPrinterWithPCTopMiddle,
  coloredPrinterWithPCBottomMiddle,
  coloredPrinterWithPCTopRight,
  coloredPrinterWithPCBottomRight,

  verticalBlackPrinterTop,
  verticalBlackPrinterBottom,
}

class Printer extends MyComponent {
  late final MyGame _game;

  late final Map<PrinterType, Sprite> _types = {
    PrinterType.coloredPrinterWithPCTopLeft:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(10, 30)),
    PrinterType.coloredPrinterWithPCBottomLeft:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(10, 31)),
    PrinterType.coloredPrinterWithPCTopMiddle:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(11, 30)),
    PrinterType.coloredPrinterWithPCBottomMiddle:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(11, 31)),
    PrinterType.coloredPrinterWithPCTopRight:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(12, 30)),
    PrinterType.coloredPrinterWithPCBottomRight:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(12, 31)),
    PrinterType.verticalBlackPrinterTop:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(13, 36)),
    PrinterType.verticalBlackPrinterBottom:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(13, 37)),
  };

  Printer(MyGame game, PrinterType type, Vector2 position, {int priority = 0})
      : super(game, position, priority) {
    _game = game;
    sprite = _types[type];
  }
}
