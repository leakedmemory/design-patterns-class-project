import 'package:flame/flame.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';

import 'player/player.dart';
import 'bosses/bosses.dart';
import 'map_maker/map_maker.dart';

class MyGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  late Maker componentsMaker = MapMaker(this);
  late var components = componentsMaker.make();

  final _scenerySpritesPath = 'scenery.png';
  final _objectsSpritesPath = 'objects.png';

  final _tileSizeInPixels = 32.0;
  late final TiledComponent _map;
  late final _mapWidthInTiles = _map.width / _tileSizeInPixels;
  late final _mapHeightInTiles = _map.height / _tileSizeInPixels;

  double get tileSizeInPixels => _tileSizeInPixels;
  double get mapWidthInPixels => _map.width;
  double get mapHeightInPixels => _map.height;
  double get mapWidthInTiles => _mapWidthInTiles;
  double get mapHeightInTiles => _mapHeightInTiles;

  late final _player = Player(this);
  late final _cpu = CPU(this);

  String get scenerySpritePath => _scenerySpritesPath;
  String get objectsSpritePath => _objectsSpritesPath;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await Flame.images.load(_scenerySpritesPath);
    await Flame.images.load(_objectsSpritesPath);

    _map = await TiledComponent.load('map.tmx', Vector2.all(_tileSizeInPixels));
    await add(_map);
    mapComponents(1);
    await add(_player);

    camera.viewport = FixedResolutionViewport(
        Vector2(_map.width, _map.height + _tileSizeInPixels));
  }

  Sprite gameSprites(String spritePath, Vector2 position) {
    return Sprite(Flame.images.fromCache(spritePath),
        srcPosition: position, srcSize: Vector2.all(_tileSizeInPixels));
  }

  void mapComponents(int op) {
    for (Component c in components) {
      if (op == 1) {
        add(c);
      } else {
        if ((c.toString() != "Instance of 'Wall'") &
            (c.toString() != "Instance of 'Plant'"))  {
          remove(c);
        }
      }
    }
  }

  void startCombat() {
    add(_cpu);
    mapComponents(2);
  }
}
