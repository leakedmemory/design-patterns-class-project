import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';

import 'my_game.dart';
import 'player/player.dart';

class TextBox extends TextBoxComponent {
  late final MyGame _game;
  late final Player _player;

  TextBox({required String text, required MyGame game, required Player player})
      : super(
            text: text,
            position: Vector2(game.mapWidthInPixels / 2, 100),
            boxConfig: TextBoxConfig(
                dismissDelay: 1.0,
                maxWidth: game.size.x * 0.5,
                timePerChar: 0.1)) {
    anchor = Anchor.bottomCenter;
    _game = game;
    _player = player;
  }

  @override
  void drawBackground(Canvas c) {
    Rect rect = Rect.fromLTWH(0, 0, width, height);
    c.drawRect(rect, Paint()..color = const Color.fromARGB(143, 45, 46, 47));
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
