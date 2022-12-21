import '../../player.dart';
import 'command.dart';

class AttackCommand implements Command {
  late final Player _player;

  AttackCommand(Player player) {
    _player = player;
  }

  @override
  void execute() {
    if (_player.inCombat) {
      _player.attackStrategy.attack();
    }
  }
}
