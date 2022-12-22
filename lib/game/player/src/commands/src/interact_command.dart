import '../../../../my_game.dart';
import '../../player.dart';
import 'command.dart';

class InteractCommand implements Command {
  late final Player _player;
  late final MyGame _game;

  InteractCommand(MyGame game, Player player) {
    _game = game;
    _player = player;
  }

  @override
  void execute() {
    if (_playerIsInFrontOfNotebook()) {
      _game.startCombatWithCPU();
      _player.inCombat = true;
    }
  }

  bool _playerIsInFrontOfNotebook() {
    return (!_player.inCombat) &
        (_player.position.x > 255) &
        (_player.position.x < 290) &
        (_player.position.y > 255) &
        (_player.position.y < 280);
  }
}
