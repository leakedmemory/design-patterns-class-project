import 'keyboard_listener.dart';
import 'player.dart';

class MovementObserver {
  late final CustomKeyboardListener _keyboardListener;
  late final Player _player;

  late final Map<String, Function> _validMovements = {
    'A': () {
      _player.movement.x -= 1;
    },
    'D': () {
      _player.movement.x += 1;
    },
    'W': () {
      _player.movement.y -= 1;
      _player.animation = _player.upAnimation;
    },
    'S': () {
      _player.movement.y += 1;
      _player.animation = _player.downAnimation;
    },
  };

  MovementObserver(subject, Player player) {
    _keyboardListener = subject;
    subject.addObserver(this);
    _player = player;
  }

  void update(Set<String> keysPressed) {
    if (keysPressed.isEmpty) {
      _player.animation = _player.idle;
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
