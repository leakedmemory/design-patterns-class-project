import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';

class MyGame extends FlameGame {
  late TiledComponent mapComponent;
  final _tileSize = 32.0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final mapComponent =
        await TiledComponent.load('debug/map.tmx', Vector2.all(_tileSize));
    add(mapComponent);
  }
}
