import 'package:flutter/widgets.dart';
import 'package:flame/game.dart';

import 'game/my_game.dart';

void main() {
  final game = MyGame();
  game.logger.log('Iniciando jogo');
  runApp(GameWidget(game: game));
}
