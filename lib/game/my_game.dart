import 'dart:async' show Timer;

import 'package:flame/flame.dart';
import 'package:flame/components.dart' hide Timer;
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';

import 'logger/logger.dart';
import 'player/player.dart';
import 'bosses/bosses.dart';
import 'map_builder/map_builder.dart';
import 'text_box.dart';

class MyGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  final Logger _logger = Logger();

  Logger get logger => _logger;

  late TextBox _textBox;
  late TextBox _textBox2;

  // mapa
  late final Builder _mapBuilder = MapBuilder(this);
  late final _components = _mapBuilder.make();
  final _scenerySpritesPath = 'scenery.png';
  final _objectsSpritesPath = 'objects.png';
  final _tileSizeInPixels = 32.0;
  late final TiledComponent _map;
  late final _mapWidthInTiles = _map.width / _tileSizeInPixels;
  late final _mapHeightInTiles = _map.height / _tileSizeInPixels;

  String get scenerySpritePath => _scenerySpritesPath;
  String get objectsSpritePath => _objectsSpritesPath;
  double get tileSizeInPixels => _tileSizeInPixels;
  double get mapWidthInPixels => _map.width;
  double get mapHeightInPixels => _map.height;
  double get mapWidthInTiles => _mapWidthInTiles;
  double get mapHeightInTiles => _mapHeightInTiles;

  late final _player = Player(this);
  late final _cpu = CPU(this, _player);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    logger.log('Carregando cenário');
    await Flame.images.load(_scenerySpritesPath);

    logger.log('Carregando objetos');
    await Flame.images.load(_objectsSpritesPath);

    logger.log('Iniciando mapa');
    _map = await TiledComponent.load('map.tmx', Vector2.all(_tileSizeInPixels));
    await add(_map);
    mapComponents(1);

    logger.log('Adicionando player');
    await add(_player);

    camera.viewport = FixedResolutionViewport(
        Vector2(_map.width, _map.height + _tileSizeInPixels));

    _textBox = TextBox(
        text: 'Não aguento mais ter que consertar computador da Negativo...',
        game: this,
        player: _player,
        positionX: mapWidthInPixels / 2,
        size: 0.6);

    _textBox2 = TextBox(
        text: 'Aperte F para iniciar o reparo do computador.',
        game: this,
        player: _player,
        positionX: 305,
        positionY: 200,
        scale: 0.5,
        size: 0.2,
        time: 1);

    add(_textBox);

    Timer(const Duration(milliseconds: 8500), () => add(_textBox2));
    Timer(const Duration(milliseconds: 14000), () => remove(_textBox2));

    startGame();
  }

  Sprite gameSprites(String spritePath, Vector2 position) {
    return Sprite(Flame.images.fromCache(spritePath),
        srcPosition: position, srcSize: Vector2.all(_tileSizeInPixels));
  }

  void mapComponents(int op) {
    for (Component component in _components) {
      if (op == 1) {
        add(component);
      } else if (_isRemovable(component)) {
        remove(component);
      }
    }
  }

  bool _isRemovable(Component component) {
    return (component is! WallComponent) &
        (component is! PlantComponent) &
        (component is! ShelfComponent) &
        (component is! BoardComponent);
  }

  void startGame() {
    Timer(
        const Duration(milliseconds: 1500),
        () => {
              _player.moveSpeed = 85,
              _player.movement.y -= 1,
              _player.animation = _player.upAnimation,
              _player.canWalk = false
            });

    Timer(
        const Duration(milliseconds: 4500),
        () => {
              _player.movement.y = 0,
              _player.animation = _player.leftAnimation,
              _player.movement.x -= 1
            });

    Timer(
        const Duration(milliseconds: 5620),
        () => {
              _player.movement.x = 0,
              _player.animation = _player.upAnimation,
              _player.movement.y -= 1
            });

    Timer(
        const Duration(milliseconds: 6100),
        () => {
              _player.movement.y = 0,
              _player.animation = _player.idleUp,
              _player.moveSpeed = 135.0
            });
  }

  void startCombatWithCPU() {
    logger.log('Iniciando combate com CPU');
    logger.log('Adicionando inimigo no mapa');
    add(_cpu);
    _player.attackStrategy = SlapAttack(_player);
    mapComponents(2);
  }
}
