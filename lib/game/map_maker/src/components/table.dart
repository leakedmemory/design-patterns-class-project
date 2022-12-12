import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../../my_game.dart';
import '../abstractions/my_component.dart';

class Table extends MyComponent with CollisionCallbacks {
  late final MyGame _game;

  late final Map<String, Sprite> _types = {
    'double_feet': _game.gameSprites(
        _game.objectsSpritePath, Vector2(0, _game.tileSize * 7)),
    'turn_to_right': _game.gameSprites(
        _game.objectsSpritePath, Vector2(0, _game.tileSize * 6)),
    'left_above_turn': _game.gameSprites(
        _game.objectsSpritePath, Vector2(0, _game.tileSize * 5)),
    'left_corner_turn': _game.gameSprites(
        _game.objectsSpritePath, Vector2(0, _game.tileSize * 4)),
    'bottom_corner': _game.gameSprites(_game.objectsSpritePath,
        Vector2(_game.tileSize * 2, _game.tileSize * 6)),
    'bottom_right_corner_turn': _game.gameSprites(_game.objectsSpritePath,
        Vector2(_game.tileSize * 3, _game.tileSize * 6)),
    'center': _game.gameSprites(_game.objectsSpritePath,
        Vector2(_game.tileSize * 2, _game.tileSize * 5)),
    'right_corner': _game.gameSprites(_game.objectsSpritePath,
        Vector2(_game.tileSize * 3, _game.tileSize * 5)),
    'top_corner': _game.gameSprites(_game.objectsSpritePath,
        Vector2(_game.tileSize * 2, _game.tileSize * 4)),
    'top_right_corner_turn': _game.gameSprites(_game.objectsSpritePath,
        Vector2(_game.tileSize * 3, _game.tileSize * 4)),
    'bottom_left_corner': _game.gameSprites(_game.objectsSpritePath,
        Vector2(_game.tileSize * 7, _game.tileSize * 31)),
    'top_left_corner': _game.gameSprites(_game.objectsSpritePath,
        Vector2(_game.tileSize * 7, _game.tileSize * 30)),
    'top_right_corner': _game.gameSprites(_game.objectsSpritePath,
        Vector2(_game.tileSize * 9, _game.tileSize * 30)),
    'bottom_right_corner': _game.gameSprites(_game.objectsSpritePath,
        Vector2(_game.tileSize * 9, _game.tileSize * 31)),
  };

  Table(MyGame game, String type, Vector2 position) : super(game, position) {
    _game = game;
    sprite = _types[type];
  }
}
