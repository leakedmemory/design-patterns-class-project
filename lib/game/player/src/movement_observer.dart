import 'package:design_patterns_project/game/utils/observer.dart';
import 'package:design_patterns_project/game/player/player.dart';

class MovementObserver implements Observer<Set<String>> {
  late final Subject _subject;
  late final Player _player;
  String direction = "u";

  late final Map<String, Function> _validMovements = {
    "A": () {
      _player.movement.x -= 1;
    },
    "D": () {
      _player.movement.x += 1;
    },
    "W": () {
      _player.movement.y -= 1;
      _player.player.animation = _player.upAnimation;
    },
    "S": () {
      _player.movement.y += 1;
      _player.player.animation = _player.downAnimation;
    },
  };

  MovementObserver(Subject subject, Player player) {
    _subject = subject;
    subject.addObserver(this);
    _player = player;
  }

  @override
  void update(Set<String> keysPressed) {
    switch (direction) {
      case "u":
        _player.player.animation = _player.idleUpAnimation;
        break;
      case "d":
        _player.player.animation = _player.idleDownAnimation;
        break;
    }

    for (final key in keysPressed) {
      final movement = _validMovements[key];
      if (movement != null) {
        movement();
        direction = movement.toString().substring(175, 176);
      }
    }
  }

  Subject get subject => _subject;
}
