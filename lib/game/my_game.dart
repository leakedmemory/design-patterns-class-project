import 'package:flame/flame.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';

import 'player/player.dart';
import "bosses/cpu.dart";
import 'map_maker/map_maker.dart';
import 'map_maker/src/abstractions/maker.dart';

class MyGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  final _scenerySpritesPath = 'scenery.png';
  final _objectsSpritesPath = 'objects.png';

  final _mapWidthInTiles = 22.0;
  final _mapHeightInTiles = 19.0;
  final _tileSizeInPixels = 32.0;
  late final _mapWidthInPixels = _tileSizeInPixels * _mapWidthInTiles;
  late final _mapHeightInPixels = _tileSizeInPixels * _mapHeightInTiles;

  double get mapWidthInTiles => _mapWidthInTiles;
  double get mapHeightInTiles => _mapHeightInTiles;
  double get tileSizeInPixels => _tileSizeInPixels;
  double get mapWidthInPixels => _mapWidthInPixels;
  double get mapHeightInPixels => _mapHeightInPixels;

  late final _player = Player(this);
  late final _cpu = Cpu(this);

  String get scenerySpritePath => _scenerySpritesPath;
  String get objectsSpritePath => _objectsSpritesPath;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await Flame.images.load(_scenerySpritesPath);
    await Flame.images.load(_objectsSpritesPath);

    final map =
        await TiledComponent.load('map.tmx', Vector2.all(_tileSizeInPixels));
    await add(map);

    final Maker componentsMaker = MapMaker(this);
    final components = componentsMaker.make();
    for (Component c in components) {
      await add(c);
    }

    await add(_player);
    await add(_cpu);

    camera.viewport = FixedResolutionViewport(Vector2(map.width, map.height));
  }

  Sprite gameSprites(String spritePath, Vector2 position) {
    return Sprite(Flame.images.fromCache(spritePath),
        srcPosition: position, srcSize: Vector2.all(_tileSizeInPixels));
  }
}
