import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../../my_game.dart';
import '../abstractions/my_component.dart';

class Wall extends MyComponent with CollisionCallbacks {
  late final MyGame _game;

  late final Map<String, Sprite> _types = {
    'brown_top': _game.gameSprites(
        _game.scenerySpritePath, Vector2(_game.tileSize, _game.tileSize * 9)),
    'brown_bottom': _game.gameSprites(
        _game.scenerySpritePath, Vector2(_game.tileSize, _game.tileSize * 10)),
    'white_bottom': _game.gameSprites(_game.scenerySpritePath,
        Vector2(_game.tileSize * 8, _game.tileSize * 3)),
    'white_right': _game.gameSprites(_game.scenerySpritePath,
        Vector2(_game.tileSize * 9, _game.tileSize * 2)),
    'white_left': _game.gameSprites(_game.scenerySpritePath,
        Vector2(_game.tileSize * 7, _game.tileSize * 2))
  };

  Wall(MyGame game, String type, Vector2 position) : super(game, position) {
    _game = game;
    sprite = _types[type];
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(RectangleHitbox()..collisionType = CollisionType.passive);
  }
}
