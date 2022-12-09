import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

class Table extends SpriteAnimationComponent
    with HasGameRef, KeyboardHandler, CollisionCallbacks {

  late ShapeHitbox hitbox;
  late final SpriteAnimation idle;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    SpriteSheet sprite = SpriteSheet(
        image: await Flame.images.load("player/test.png"),
        srcSize: Vector2(35, 35));

    hitbox = CircleHitbox();
    add(hitbox);
    idle = sprite.createAnimation(row: 0, stepTime: 0.5, to: 1);

    animation = idle;
    position = Vector2(70, 360);
    size = Vector2(35, 35);
  }
}
