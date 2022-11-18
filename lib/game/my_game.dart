import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';

import 'player/player.dart';

class MyGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  late TiledComponent mapComponent;
  static const _tileSize = 16.0;
  final _player = Player();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    camera.zoom = 2;
    final mapComponent =
        await TiledComponent.load('map.tmx', Vector2.all(_tileSize));
    add(mapComponent);
    await add(_player);
  }

  static double get tileSize => _tileSize;
}
