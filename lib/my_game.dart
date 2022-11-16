import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';

import 'package:design_patterns_project/components/player.dart';

class MyGame extends FlameGame with HasKeyboardHandlerComponents {
  late TiledComponent mapComponent;
  final _tileSize = 32.0;
  final _player = Player();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final mapComponent =
        await TiledComponent.load('debug/map.tmx', Vector2.all(_tileSize));
    add(mapComponent);
    await add(_player);

    // camera.followComponent(_player);
  }
}
