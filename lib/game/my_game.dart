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
  late final _mapWidth = _tileSize * 22;
  late final _mapHeight = _tileSize * 19;

  late final _player = Player(this);

  double get tileSize => _tileSize;

  String get scenerySpritePath => _scenerySpritesPath;
  String get objectsSpritePath => _objectsSpritesPath;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await Flame.images.load(_scenerySpritesPath);
    await Flame.images.load(_objectsSpritesPath);

    final components = await _createComponents();
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

  Future<List<Component>> _createComponents() async {
    List<Component> components = [
      await TiledComponent.load("map.tmx", Vector2.all(_tileSize)),
      ..._createWalls(),
    ];

    return components;
  }

  List<Wall> _createWalls() {
    List<Wall> walls = [
      ..._createTopWalls(),
      ..._createBottomWalls(),
      ..._createRightWalls(),
      ..._createLeftWalls(),
    ];

    return walls;
  }

  List<Wall> _createTopWalls() {
    List<Wall> walls = [];
    for (double x = 0; x < _mapWidth; x += _tileSize) {
      walls.add(Wall(this, "brown_top", Vector2(x, 0)));
      walls.add(Wall(this, "brown_bottom", Vector2(x, _tileSize)));
    }

    return walls;
  }

  List<Wall> _createBottomWalls() {
    List<Wall> walls = [];
    for (double x = 0; x < _mapWidth; x += _tileSize) {
      walls.add(Wall(this, "white_bottom", Vector2(x, _mapHeight)));
    }

    return walls;
  }

  List<Wall> _createRightWalls() {
    List<Wall> walls = [];
    for (double y = 0; y < _mapHeight; y += _tileSize) {
      walls.add(Wall(this, "white_right", Vector2(0, y)));
    }

    return walls;
  }

  List<Wall> _createLeftWalls() {
    List<Wall> walls = [];
    for (double y = 0; y < _mapHeight; y += _tileSize) {
      walls.add(Wall(this, "white_left", Vector2(_mapWidth - _tileSize, y)));
    }

    return walls;
  }
}
