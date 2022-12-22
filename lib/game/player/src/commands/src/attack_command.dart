import 'dart:async' show Timer;
import '../../../../my_game.dart';
import '../../player.dart';
import 'attack_object.dart';
import 'command.dart';

class AttackCommand implements Command {
  late final Player _player;
  late final MyGame _game;
  late final _attack = AttackObject(_player);

  AttackCommand(Player player, MyGame game) {
    _player = player;
    _game = game;
  }

  @override
  void execute() {
    if (_player.inCombat) {
      _player.attackStrategy.attack();
      _game.add(_attack);
      Timer(const Duration(milliseconds: 700), () => _game.remove(_attack));
    }
  }
}
