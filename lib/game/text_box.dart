import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';

import 'my_game.dart';
import 'player/player.dart';

class TextBox extends TextBoxComponent {
  late final MyGame _game;
  late final Player _player;

  TextBox({required String text, 
  required MyGame game, 
  required Player player, 
  double positionX = 50, 
  double positionY = 115, 
  double size = 0.5,
  double scaleX = 1,
  double scaleY = 1})
      : super(
            text: text,
            position: Vector2(positionX, positionY),
            boxConfig: TextBoxConfig(
                dismissDelay: 1.0,
                maxWidth: game.size.x * size,
                timePerChar: 0.1),
                scale: Vector2(scaleX,scaleY)) {
    anchor = Anchor.bottomCenter;
    _game = game;
    _player = player;
    priority = 10;
  }

  @override
  void drawBackground(Canvas c) {
    Rect rect = Rect.fromLTWH(0, 0, width, height);
    c.drawRect(rect, Paint()..color = const Color.fromARGB(200, 45, 46, 47));
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (finished) {
      _player.canWalk = true;
      _game.remove(this);
    }
  }
}
