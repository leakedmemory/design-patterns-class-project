import '../../player.dart';
import 'command.dart';

class MoveDownCommand implements Command {
  late final Player _player;

  MoveDownCommand(Player player) {
    _player = player;
  }

  @override
  void execute() {
    _player.movement.y += 1;
    _player.animation = _player.downAnimation;
  }
}
