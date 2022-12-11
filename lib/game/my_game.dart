import "package:flame/flame.dart";
import "package:flame/components.dart";
import "package:flame/events.dart";
import "package:flame/game.dart";
import "package:flame_tiled/flame_tiled.dart";

import "package:design_patterns_project/game/player/player.dart";
import "package:design_patterns_project/game/components/components.dart";

class MyGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  final _scenerySpritesPath = "sets/scenery.png";
  final _objectsSpritesPath = "sets/objects.png";

  final _tileSize = 32.0;
  late final _player = Player(this);

  double get tileSize => _tileSize;

  String get scenerySpritePath => _scenerySpritesPath;
  String get objectsSpritePath => _objectsSpritesPath;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await Flame.images.load(_scenerySpritesPath);
    await Flame.images.load(_objectsSpritesPath);

    final mapComponent =
        await TiledComponent.load("map.tmx", Vector2.all(_tileSize));
    final topWall = Wall(this, "brown_top", Vector2.all(0));
    final bottomWall = Wall(this, "brown_bottom", Vector2(0, _tileSize));

    await add(mapComponent);
    await add(_player);
    await add(topWall);
    await add(bottomWall);

    camera.zoom = 1.5;
  }

  Sprite gameSprites(String spritePath, Vector2 position) {
    return Sprite(Flame.images.fromCache(spritePath),
        srcPosition: position, srcSize: Vector2.all(_tileSize));
  }
}
