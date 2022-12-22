import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../player.dart';

class AttackObject extends SpriteAnimationComponent with CollisionCallbacks {
  late final ShapeHitbox hitbox;
  late Player _player;

  AttackObject(Player player) : super(size: Vector2.all(32)) {
    _player = player;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    
    hitbox = RectangleHitbox();
    add(hitbox);
  }

  @override
  void update(double dt) {
    position = _player.position;
    position.x += 18;
    position.y += 18;
    if ((_player.animation == _player.idleUp) |
        (_player.animation == _player.upAnimation)) {
      position.y -= 35;
      hitbox.size = Vector2(32, 8);
    } else if ((_player.animation == _player.idleDown) |
        (_player.animation == _player.downAnimation)) {
      position.y += 45;
      hitbox.size = Vector2(32, 8);
    } else if ((_player.animation == _player.idleLeft) |
        (_player.animation == _player.leftAnimation)) {
      position.x -= 35;
      hitbox.size = Vector2(8, 32);
    } else if ((_player.animation == _player.idleRight) |
        (_player.animation == _player.rightAnimation)) {
      position.x += 50;
      hitbox.size = Vector2(8, 32);
    }
    super.update(dt);
  }
}
