import '../../player.dart';
import 'command.dart';

class MoveRightCommand implements Command {
  late final Player _player;

  MoveRightCommand(Player player) {
    _player = player;
  }

  @override
  void execute() {
    _player.movement.x += 1;
    _player.animation = _player.rightAnimation;
  }
}
