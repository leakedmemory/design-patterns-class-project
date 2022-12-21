import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../../../my_game.dart';
import 'my_component.dart';

enum WallComponentType {
  brownTop,
  brownBottom,

  whiteLeft,
  whiteRight,
  whiteBottom,
}

class WallComponent extends MyComponent with CollisionCallbacks {
  late final MyGame _game;

  late final Map<WallComponentType, Sprite> _types = {
    WallComponentType.brownTop: _game.gameSprites(
        _game.scenerySpritePath, getSpriteTile(Vector2(1, 9))),
    WallComponentType.brownBottom: _game.gameSprites(
        _game.scenerySpritePath, getSpriteTile(Vector2(1, 10))),
    WallComponentType.whiteLeft: _game.gameSprites(
        _game.scenerySpritePath, getSpriteTile(Vector2(7, 2))),
    WallComponentType.whiteRight: _game.gameSprites(
        _game.scenerySpritePath, getSpriteTile(Vector2(9, 2))),
    WallComponentType.whiteBottom: _game.gameSprites(
        _game.scenerySpritePath, getSpriteTile(Vector2(8, 3))),
  };

  WallComponent(MyGame game, WallComponentType type, Vector2 position,
      {int priority = 0})
      : super(game, position, priority) {
    _game = game;
    sprite = _types[type];
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(RectangleHitbox()..collisionType = CollisionType.passive);
  }
}
