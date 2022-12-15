import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

import '../../../player/player.dart';
import '../../../my_game.dart';
import '../../../player/src/player.dart';

class CPU extends SpriteAnimationComponent with CollisionCallbacks {
  late final MyGame _game;

  final Vector2 _velocity = Vector2.zero();

  late final ShapeHitbox hitbox;

  bool _canDamage = false;

  CPU(MyGame game) : super(size: Vector2.all(game.tileSizeInPixels)) {
    _game = game;

    debugMode = true;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    SpriteSheet sprite = SpriteSheet(
        image: await Flame.images.load('player.png'),
        srcSize: Vector2.all(_game.tileSizeInPixels));

    hitbox = RectangleHitbox();
    add(hitbox);

    animation = sprite.createAnimation(row: 1, stepTime: 0.2, to: 1);
    position = Vector2(300, 300);
    size = Vector2.all(_game.tileSizeInPixels * 2);

    add(TimerComponent(
        period: 2,
        repeat: true,
        onTick: () {
          _canDamage = true;
        }));
  }

  @override
  void update(double dt) {
    position += _velocity * dt;
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player) {
      if (position.x - 50 < other.position.x) {
        if (_canDamage) {
          _canDamage = false;
          if (other.health != 1) {
            other.health = 1;
            other.skin(other.sprite);
          } else {
            print('morreu');
          }
        }
      }
    }

    super.onCollision(intersectionPoints, other);
  }
}
