import 'package:flame/input.dart';
import 'package:flame/widgets.dart';

import '../../../my_game.dart';
import '../abstractions/my_component.dart';

enum ComputerType {
  threeVerticalBlackMonitorsTop,
  threeVerticalBlackMonitorsMiddle,
  threeVerticalBlackMonitorsBottom,

  threeVerticalWhiteMonitorsTop,
  threeVerticalWhiteMonitorsMiddle,
  threeVerticalWhiteMonitorsBottom,

  rightDiagonalBlackMonitor,
  rightDiagonalWhiteMonitor,

  diagonalNotebookTop,
  diagonalNotebookBottom,

  threeHorizontalWhiteMonitorsLeft,
  threeHorizontalWhiteMonitorsMiddle,
  threeHorizontalWhiteMonitorsRight,
  horizontalKeyboard,
}

class Computer extends MyComponent {
  late final MyGame _game;

  late final Map<ComputerType, Sprite> _types = {
    ComputerType.threeVerticalBlackMonitorsTop:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(10, 35)),
    ComputerType.threeVerticalBlackMonitorsMiddle:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(10, 36)),
    ComputerType.threeVerticalBlackMonitorsBottom:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(10, 37)),
    ComputerType.threeVerticalWhiteMonitorsTop:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(11, 35)),
    ComputerType.threeVerticalWhiteMonitorsMiddle:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(11, 36)),
    ComputerType.threeVerticalWhiteMonitorsBottom:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(11, 37)),
    ComputerType.rightDiagonalBlackMonitor:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(12, 35)),
    ComputerType.rightDiagonalWhiteMonitor:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(12, 36)),
    ComputerType.threeHorizontalWhiteMonitorsLeft:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(13, 13)),
    ComputerType.threeHorizontalWhiteMonitorsMiddle:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(14, 13)),
    ComputerType.threeHorizontalWhiteMonitorsRight:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(15, 13)),
    ComputerType.horizontalKeyboard:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(14, 14)),
    ComputerType.diagonalNotebookTop:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(15, 17)),
    ComputerType.diagonalNotebookBottom:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(15, 18)),
  };

  Computer(MyGame game, ComputerType type, Vector2 position, {int priority = 0})
      : super(game, position, priority) {
    _game = game;
    sprite = _types[type];
  }
}
