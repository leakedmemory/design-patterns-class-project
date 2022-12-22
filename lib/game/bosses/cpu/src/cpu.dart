import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

import '../../../player/player.dart';
import '../../../my_game.dart';

class CPU extends SpriteAnimationComponent with CollisionCallbacks {
  late final MyGame _game;
  late final ShapeHitbox hitbox;

  late double _moveSpeed = 57.5;
  Vector2 _movement = Vector2.zero();
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
  void moveToPlayer() {
    // Calcula a distância entre o boss e o personagem principal
    double distance = target.distanceTo(position);

    // Se a distância for menor que a metade do tamanho do boss, para o movimento
    if (distance < size.x / 2) {
      _movement = Vector2.zero();
      return;
    }

    // Calcula a direção que o boss deve seguir para alcançar o personagem principal
    Vector2 direction = target - position;
    direction = direction.normalized();

    // Atualiza a direção de movimento do boss
    _movement = direction;

    // Verifica a direção de movimento e altera a animação correta
    if (direction.x > 0 && direction.y > 0) {
      // Direita e cima
      animation = downAnimation;
    } else if (direction.x > 0 && direction.y < 0) {
      // Direita e baixo
      animation = upAnimation;
    } else if (direction.x < 0 && direction.y > 0) {
      // Esquerda e cima
      animation = downAnimation;
    } else if (direction.x < 0 && direction.y < 0) {
      // Esquerda e baixo
      animation = upAnimation;
    } else if (direction.x > 0) {
      // Direita
      animation = rightAnimation;
    } else if (direction.x < 0) {
      // Esquerda
      animation = leftAnimation;
    } else if (direction.y > 0) {
      // Cima
      animation = downAnimation;
    } else if (direction.y < 0) {
      // Baixo
      animation = upAnimation;
    }
  }

 @override
  void update(double dt) {
    // Atualiza a posição do boss de acordo com a posição do personagem principal
    moveToPlayer();

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
