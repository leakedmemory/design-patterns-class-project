import 'keyboard_listener.dart';
import 'player.dart';

class MovementObserver {
  late final CustomKeyboardListener _keyboardListener;
  late final Player _player;

  void attack() {
    if ((_player.animation == _player.upAnimation) |
        (_player.animation == _player.idleUp)) {
      _player.animation = _player.attackUpAnimation;
    } else if ((_player.animation == _player.downAnimation) |
        (_player.animation == _player.idleDown)) {
      _player.animation = _player.attackDownAnimation;
    } else if ((_player.animation == _player.rightAnimation) |
        (_player.animation == _player.idleRight)) {
      _player.animation = _player.attackRightAnimation;
    } else if ((_player.animation == _player.leftAnimation) |
        (_player.animation == _player.idleLeft)) {
      _player.animation = _player.attackLeftAnimation;
    }
  }

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
      attack();
    },
  };

  MovementObserver(subject, Player player) {
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

  CustomKeyboardListener get keyboardListener => _keyboardListener;
}
