import 'package:flame/input.dart';
import 'package:flame/widgets.dart';

import '../../../../my_game.dart';
import 'my_component.dart';

enum BoardComponentType {
  pieTopLeft,
  pieTopRight,
  pieBottomLeft,
  pieBottomRight,
}

class BoardComponent extends MyComponent {
  late final MyGame _game;

  late final Map<BoardComponentType, Sprite> _types = {
    BoardComponentType.pieTopLeft: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(9, 14))),
    BoardComponentType.pieTopRight: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(10, 14))),
    BoardComponentType.pieBottomLeft: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(9, 15))),
    BoardComponentType.pieBottomRight: _game.getSpriteFromCache(
        _game.objectsSpritePath, getSpriteTile(Vector2(10, 15))),
  };

  BoardComponent(MyGame game, BoardComponentType type, Vector2 position,
      {int priority = 0})
      : super(game, position, priority) {
    _game = game;
    sprite = _types[type];
  }
}
