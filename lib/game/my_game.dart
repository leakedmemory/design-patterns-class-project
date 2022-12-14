import 'package:flame/flame.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';

import 'player/player.dart';
import 'map_maker/map_maker.dart';
import 'map_maker/src/abstractions/maker.dart';

class MyGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  final _scenerySpritesPath = 'scenery.png';
  final _objectsSpritesPath = 'objects.png';

  final _tileSize = 32.0;
  late final _mapWidth = _tileSize * 22;
  late final _mapHeight = _tileSize * 19;

  double get tileSize => _tileSize;
  double get mapWidth => _mapWidth;
  double get mapHeight => _mapHeight;

  late final _player = Player(this);

  String get scenerySpritePath => _scenerySpritesPath;
  String get objectsSpritePath => _objectsSpritesPath;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await Flame.images.load(_scenerySpritesPath);
    await Flame.images.load(_objectsSpritesPath);

    final map = await TiledComponent.load('map.tmx', Vector2.all(_tileSize));
    await add(map);

    final Maker componentsMaker = MapMaker(this);
    final components = componentsMaker.make();
    for (var c in components) {
      await add(c);
    }

    await add(_player);

    camera.zoom = 1.5;
  }

  Sprite gameSprites(String spritePath, Vector2 position) {
    return Sprite(Flame.images.fromCache(spritePath),
        srcPosition: position, srcSize: Vector2.all(_tileSize));
  }
}
