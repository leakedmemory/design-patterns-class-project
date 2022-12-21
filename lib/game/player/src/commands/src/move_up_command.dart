import '../../player.dart';
import 'command.dart';

class MoveUpCommand implements Command {
  late final Player _player;

  MoveUpCommand(Player player) {
    _player = player;
  }

  @override
  void execute() {
    _player.movement.y -= 1;
    _player.animation = _player.upAnimation;
  }
}
