import '../../my_game.dart';
import 'commands/commands.dart';
import 'keyboard_listener.dart';
import 'player.dart';

class ActionsObserver {
  late final MyKeyboardListener _keyboardListener;
  late final Player _player;

  late final Command _keyA;
  late final Command _keyD;
  late final Command _keyW;
  late final Command _keyS;
  late final Command _keySpace;
  late final Command _keyF;

  late final Map<String, Function> _validMovements = {
    'A': () {
      _keyA.execute();
    },
    'D': () {
      _keyD.execute();
    },
    'W': () {
      _keyW.execute();
    },
    'S': () {
      _keyS.execute();
    },
    ' ': () {
      _keySpace.execute();
    },
    'F': () {
      _keyF.execute();
    },
  };

  ActionsObserver(MyGame game, MyKeyboardListener subject, Player player) {
    _keyboardListener = subject;
    subject.addObserver(this);
    _player = player;

    _keyA = MoveLeftCommand(player);
    _keyD = MoveRightCommand(player);
    _keyW = MoveUpCommand(player);
    _keyS = MoveDownCommand(player);
    _keySpace = AttackCommand(player);
    _keyF = InteractCommand(game, player);
  }

  void update(Set<String> keysPressed) {
    if (keysPressed.isEmpty) {
      if (_player.animation == _player.upAnimation) {
        _player.animation = _player.idleUp;
      } else if (_player.animation == _player.downAnimation) {
        _player.animation = _player.idleDown;
      } else if (_player.animation == _player.rightAnimation) {
        _player.animation = _player.idleRight;
      } else if (_player.animation == _player.leftAnimation) {
        _player.animation = _player.idleLeft;
      }
    } else {
      _move(keysPressed);
    }
  }

  void _move(Set<String> keysPressed) {
    for (final key in keysPressed) {
      final movement = _validMovements[key];
      if (movement != null) {
        movement();
      }
    }
  }

  MyKeyboardListener get keyboardListener => _keyboardListener;
}
