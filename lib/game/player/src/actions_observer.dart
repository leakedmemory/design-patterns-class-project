import '../../my_game.dart';
import 'keyboard_listener.dart';
import 'player.dart';

class ActionsObserver {
  late final MyKeyboardListener _keyboardListener;
  late final MyGame _game;
  late final Player _player;

  late final Map<String, Function> _validMovements = {
    'A': () {
      _player.movement.x -= 1;
      _player.animation = _player.leftAnimation;
    },
    'D': () {
      _player.movement.x += 1;
      _player.animation = _player.rightAnimation;
    },
    'W': () {
      _player.movement.y -= 1;
      _player.animation = _player.upAnimation;
    },
    'S': () {
      _player.movement.y += 1;
      _player.animation = _player.downAnimation;
    },
    ' ': () {
      if (_player.inCombat) {
        _player.attackStrategy.attack();
      }
    },
    'F': () {
      if (_playerIsInFrontOfNotebook()) {
        _game.startCombatWithHD();
        _player.inCombat = true;
      }
    },
  };

  bool _playerIsInFrontOfNotebook() {
    return (!_player.inCombat) &
        (_player.position.x > 255) &
        (_player.position.x < 290) &
        (_player.position.y > 255) &
        (_player.position.y < 280);
  }

  ActionsObserver(MyGame game, MyKeyboardListener subject, Player player) {
    _game = game;
    _keyboardListener = subject;
    subject.addObserver(this);
    _player = player;
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
