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

  verticalBlackMonitor,
  verticalKeyboard,

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
  };

  Computer(MyGame game, ComputerType type, Vector2 position)
      : super(game, position) {
    _game = game;
    sprite = _types[type];
  }
}
