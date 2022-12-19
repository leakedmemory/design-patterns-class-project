import 'package:flame/input.dart';
import 'package:flame/widgets.dart';

import '../../../my_game.dart';
import '../abstractions/my_component.dart';

enum BoardType {
  pieTopLeft,
  pieTopRight,
  pieBottomLeft,
  pieBottomRight,
}

class Board extends MyComponent {
  late final MyGame _game;

  late final Map<BoardType, Sprite> _types = {
    BoardType.pieTopLeft:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(9, 14)),
    BoardType.pieTopRight:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(10, 14)),
    BoardType.pieBottomLeft:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(9, 15)),
    BoardType.pieBottomRight:
        _game.gameSprites(_game.objectsSpritePath, getSpriteTile(10, 15)),
  };

  Board(MyGame game, BoardType type, Vector2 position, {int priority = 0})
      : super(game, position, priority) {
    _game = game;
    sprite = _types[type];
  }
}
