import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../../my_game.dart';
import '../abstractions/my_component.dart';

enum WallType {
  brownTop,
  brownBottom,

  whiteLeft,
  whiteRight,
  whiteBottom,
}

class Wall extends MyComponent with CollisionCallbacks {
  late final MyGame _game;

  late final Map<WallType, Sprite> _types = {
    WallType.brownTop:
        _game.gameSprites(_game.scenerySpritePath, getSpriteTile(1, 9)),
    WallType.brownBottom:
        _game.gameSprites(_game.scenerySpritePath, getSpriteTile(1, 10)),
    WallType.whiteLeft:
        _game.gameSprites(_game.scenerySpritePath, getSpriteTile(7, 2)),
    WallType.whiteRight:
        _game.gameSprites(_game.scenerySpritePath, getSpriteTile(9, 2)),
    WallType.whiteBottom:
        _game.gameSprites(_game.scenerySpritePath, getSpriteTile(8, 3)),
  };

  Wall(MyGame game, WallType type, Vector2 position, {int priority = 0})
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
