import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';

import 'my_game.dart';

class TextBox extends TextBoxComponent {
  final MyGame game;
  TextBox({required String text, required this.game})
      : super(
            text: text,
            position: Vector2(game.mapWidthInPixels / 2, 100),
            boxConfig: TextBoxConfig(
                dismissDelay: 1.0,
                maxWidth: game.size.x * 0.5,
                timePerChar: 0.1
                )) {
    anchor = Anchor.bottomCenter;
  }

  @override
  void drawBackground(Canvas c) {
    Rect rect = Rect.fromLTWH(0, 0, width, height);
    c.drawRect(rect, Paint()..color = Color.fromARGB(143, 45, 46, 47));
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (finished) {
      game.remove(this);
    }
  }
}
