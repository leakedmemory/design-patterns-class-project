import 'package:flame/collisions.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';

import 'package:design_patterns_project/game/player/player.dart';

class MyGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  late final TiledComponent _mapComponent;
  static const _tileSize = 32.0;
  final _player = Player();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    camera.zoom = 1.5;
    _mapComponent =
        await TiledComponent.load('map.tmx', Vector2.all(_tileSize));
    add(_mapComponent);
    add(ScreenHitbox());
    await add(_player);
  }

  static double get tileSize => _tileSize;
}
