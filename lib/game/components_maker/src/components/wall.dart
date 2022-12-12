import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../../my_game.dart';

class Wall extends SpriteComponent with CollisionCallbacks {
  late final MyGame _game;
  late final String _type;
  late final Vector2 _position;

  late final Map<String, Sprite> _wallTypes = {
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

  Wall(MyGame game, String type, Vector2 position) {
    _game = game;
    _type = type;
    _position = position;
  }

  @override
  Future<void> onLoad() async {
    // TODO: adicionar hitbox
    super.onLoad();
    sprite = _wallTypes[_type];
    position = _position;
    size = Vector2.all(_game.tileSize);
  }
}
