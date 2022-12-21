import '../../player.dart';
import 'command.dart';

class MoveLeftCommand implements Command {
  late final Player _player;

  MoveLeftCommand(Player player) {
    _player = player;
  }

  @override
  void execute() {
    _player.movement.x -= 1;
    _player.animation = _player.leftAnimation;
  }
}
