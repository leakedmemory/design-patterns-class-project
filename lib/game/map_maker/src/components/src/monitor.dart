import 'package:flame/input.dart';
import 'package:flame/widgets.dart';

import '../../../../my_game.dart';
import 'my_component.dart';

enum MonitorComponentType {
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

class MonitorComponent extends MyComponent {
  late final MyGame _game;

  late final Map<MonitorComponentType, Sprite> _types = {
    MonitorComponentType.threeVerticalBlackMonitorsTop: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(10, 35))),
    MonitorComponentType.threeVerticalBlackMonitorsMiddle: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(10, 36))),
    MonitorComponentType.threeVerticalBlackMonitorsBottom: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(10, 37))),
    MonitorComponentType.threeVerticalWhiteMonitorsTop: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(11, 35))),
    MonitorComponentType.threeVerticalWhiteMonitorsMiddle: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(11, 36))),
    MonitorComponentType.threeVerticalWhiteMonitorsBottom: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(11, 37))),
    MonitorComponentType.rightDiagonalBlackMonitor: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(12, 35))),
    MonitorComponentType.rightDiagonalWhiteMonitor: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(12, 36))),
    MonitorComponentType.threeHorizontalWhiteMonitorsLeft: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(13, 13))),
    MonitorComponentType.threeHorizontalWhiteMonitorsMiddle: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(14, 13))),
    MonitorComponentType.threeHorizontalWhiteMonitorsRight: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(15, 13))),
    MonitorComponentType.horizontalKeyboard: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(14, 14))),
    MonitorComponentType.diagonalNotebookTop: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(15, 17))),
    MonitorComponentType.diagonalNotebookBottom: _game.gameSprites(
        _game.objectsSpritePath, getSpriteTile(Vector2(15, 18))),
  };

  MonitorComponent(MyGame game, MonitorComponentType type, Vector2 position,
      {int priority = 0})
      : super(game, position, priority) {
    _game = game;
    sprite = _types[type];
  }
}
