import 'package:flame/input.dart';
import 'package:flame/widgets.dart';

import '../../../../my_game.dart';
import 'my_component.dart';

enum PrinterComponentType {
  coloredPrinterWithPCTopLeft,
  coloredPrinterWithPCBottomLeft,
  coloredPrinterWithPCTopMiddle,
  coloredPrinterWithPCBottomMiddle,
  coloredPrinterWithPCTopRight,
  coloredPrinterWithPCBottomRight,

  verticalBlackPrinterTop,
  verticalBlackPrinterBottom,
}

class PrinterComponent extends MyComponent {
  late final MyGame _game;

  late final Map<PrinterComponentType, Sprite> _types = {
    PrinterComponentType.coloredPrinterWithPCTopLeft: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(10, 30))),
    PrinterComponentType.coloredPrinterWithPCBottomLeft: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(10, 31))),
    PrinterComponentType.coloredPrinterWithPCTopMiddle: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(11, 30))),
    PrinterComponentType.coloredPrinterWithPCBottomMiddle: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(11, 31))),
    PrinterComponentType.coloredPrinterWithPCTopRight: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(12, 30))),
    PrinterComponentType.coloredPrinterWithPCBottomRight: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(12, 31))),
    PrinterComponentType.verticalBlackPrinterTop: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(13, 36))),
    PrinterComponentType.verticalBlackPrinterBottom: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(13, 37))),
  };

  PrinterComponent(MyGame game, PrinterComponentType type, Vector2 position,
      {int priority = 0})
      : super(game, position, priority) {
    _game = game;
    sprite = _types[type];
  }
}
