import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

import '../../../player/player.dart';
import '../../../my_game.dart';

class HD extends SpriteAnimationComponent with CollisionCallbacks {
  late final MyGame _game;
  final Vector2 _velocity = Vector2.zero();
  late final ShapeHitbox hitbox;

  HD(MyGame game) : super(size: Vector2.all(game.tileSizeInPixels)) {
    _game = game;

    // debugMode = true;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    _game.logger.log('Carregando hitbox e sprite do HD');
    SpriteSheet sprite = SpriteSheet(
        image: await Flame.images.load('player.png'),
        srcSize: Vector2.all(_game.tileSizeInPixels));

    hitbox = RectangleHitbox();
    add(hitbox);

    animation = sprite.createAnimation(row: 1, stepTime: 0.2, to: 1);
    position = Vector2(400, 300);
    size = Vector2.all(_game.tileSizeInPixels * 2);
  }

  @override
  void update(double dt) {
    position += _velocity * dt;
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player) {}

    super.onCollision(intersectionPoints, other);
  }
}
