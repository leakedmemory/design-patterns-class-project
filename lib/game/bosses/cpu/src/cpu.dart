import 'dart:async' show Timer;
import 'package:flame/collisions.dart';
import 'package:flame/components.dart' hide Timer;
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

import '../../../player/player.dart';
import '../../../my_game.dart';
import '../../../player/src/commands/src/attack_object.dart';

class CPU extends SpriteAnimationComponent with CollisionCallbacks {
  late final MyGame _game;
  late final ShapeHitbox hitbox;

  late double _moveSpeed = 115.0;
  Vector2 _movement = Vector2.zero();
  Vector2 _velocity = Vector2.zero();

  late Vector2 target;
  bool _vulnerable = true;
  int _health = 3;

  late SpriteSheet sprite;

  late SpriteAnimation idleDied;

  late SpriteAnimation idleUp;
  late SpriteAnimation idleDown;
  late SpriteAnimation idleRight;
  late SpriteAnimation idleLeft;

  late SpriteAnimation upAnimation;
  late SpriteAnimation downAnimation;
  late SpriteAnimation rightAnimation;
  late SpriteAnimation leftAnimation;

  late SpriteAnimation attackUpAnimation;
  late SpriteAnimation attackDownAnimation;
  late SpriteAnimation attackRightAnimation;
  late SpriteAnimation attackLeftAnimation;

  CPU(MyGame game, Player player)
      : super(size: Vector2.all(game.tileSizeInPixels)) {
    _game = game;
    target = player.position;
    // debugMode = true;
  }

  Future<void> skin(SpriteSheet sprite) async {
    // sem boné
    idleUp = sprite.createAnimation(row: 2, stepTime: 0.5, to: 1);
    idleDown = sprite.createAnimation(row: 0, stepTime: 0.5, to: 1);
    idleRight = sprite.createAnimation(row: 5, stepTime: 0.5, to: 2);
    idleLeft = sprite.createAnimation(row: 4, stepTime: 0.5, to: 2);

    upAnimation = sprite.createAnimation(row: 1, stepTime: 0.2, to: 3);
    downAnimation = sprite.createAnimation(row: 0, stepTime: 0.2, to: 3);
    rightAnimation = sprite.createAnimation(row: 5, stepTime: 0.2, to: 3);
    leftAnimation = sprite.createAnimation(row: 4, stepTime: 0.2, to: 3);

    attackUpAnimation = sprite.createAnimation(row: 2, stepTime: 0.06);
    attackDownAnimation = sprite.createAnimation(row: 8, stepTime: 0.06);
    attackRightAnimation = sprite.createAnimation(row: 6, stepTime: 0.06);
    attackLeftAnimation = sprite.createAnimation(row: 7, stepTime: 0.06);

    idleDied = sprite.createAnimation(row: 10, stepTime: 0.06, to: 1);
    animation = idleDown;
  }

  void takeDamage() {
    _health -= 1;
    _game.logger.log('BOSS sofreu dano. Vida atual: $_health');
    if (_health == 0) {
      animation = idleDied;
    }
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    _game.logger.log('Carregando hitbox e sprite da CPU');
    SpriteSheet sprite = SpriteSheet(
        image: await Flame.images.load('cpu.png'),
        srcSize: Vector2.all(_game.tileSizeInPixels * 3));

    hitbox = RectangleHitbox(size: Vector2.all(70), position: center);
    add(hitbox);

    position = Vector2(300, 100);
    size = Vector2.all(_game.tileSizeInPixels * 3);

    skin(sprite);
  }

  @override
  void update(double dt) {
    _velocity = _movement * _moveSpeed;
    position += _velocity * dt;
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player) {}
    if (other is AttackObject) {
      if (_vulnerable) {
        Timer(const Duration(seconds: 1), () => _vulnerable = true);
        takeDamage();
        _vulnerable = false;
      }

      super.onCollision(intersectionPoints, other);
    }
  }
}
