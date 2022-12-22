import 'package:flame/components.dart' hide Timer;
import 'package:flutter/cupertino.dart';

import 'my_game.dart';
import 'player/player.dart';

class TextBox extends TextBoxComponent {
  late final MyGame _game;
  late final Player _player;
  late int _time;

  TextBox(
      {required String text,
      required MyGame game,
      required Player player,
      double positionX = 50,
      double positionY = 115,
      double size = 0.5,
      double scale = 1,
      int time = 0})
      : super(
            text: text,
            position: Vector2(positionX, positionY),
            boxConfig: TextBoxConfig(
                dismissDelay: 1.0,
                maxWidth: game.size.x * size,
                timePerChar: 0.1),
            scale: Vector2.all(scale)) {
    anchor = Anchor.bottomCenter;
    _game = game;
    _player = player;
    _time = time;
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
      _time == 1 ? {} : {_game.remove(this)};
      _player.canWalk = true;
    }
  }
}
