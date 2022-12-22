import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

import '../../../player/player.dart';
import '../../../my_game.dart';

class CPU extends SpriteAnimationComponent with CollisionCallbacks {
  late final MyGame _game;
  late final ShapeHitbox hitbox;

  late final double _moveSpeed = 115.0;
  final Vector2 _movement = Vector2.zero();
  Vector2 _velocity = Vector2.zero();

  late Vector2 target;

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
    idleRight = sprite.createAnimation(row: 5, stepTime: 0.5, from: 1, to: 2);
    idleLeft = sprite.createAnimation(row: 4, stepTime: 0.5, from: 1, to: 2);

    upAnimation = sprite.createAnimation(row: 1, stepTime: 0.2, to: 3);
    downAnimation = sprite.createAnimation(row: 0, stepTime: 0.2, to: 3);
    rightAnimation = sprite.createAnimation(row: 5, stepTime: 0.2, to: 3);
    leftAnimation = sprite.createAnimation(row: 4, stepTime: 0.2, to: 3);

    attackUpAnimation = sprite.createAnimation(row: 2, stepTime: 0.06);
    attackDownAnimation = sprite.createAnimation(row: 8, stepTime: 0.06);
    attackRightAnimation = sprite.createAnimation(row: 6, stepTime: 0.06);
    attackLeftAnimation = sprite.createAnimation(row: 7, stepTime: 0.06);

    animation = idleDown;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    _game.logger.log('Carregando hitbox e sprite da CPU');
    SpriteSheet sprite = SpriteSheet(
        image: await Flame.images.load('cpu.png'),
        srcSize: Vector2.all(_game.tileSizeInPixels * 3));

    hitbox = RectangleHitbox();
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

    super.onCollision(intersectionPoints, other);
  }
}
