import 'package:flutter/services.dart';

import 'package:design_patterns_project/game/utils/observer.dart';
import 'package:design_patterns_project/game/player/src/player.dart';

class MovementObserver implements Observer<Set<String>> {
  late final Subject<Set<String>, Set<LogicalKeyboardKey>> _subject;
  late final Player _player;

  late final Map<String, Function> _validMovements = {
    "A": () {
      _player.movement.x -= 1;
    },
    "D": () {
      _player.movement.x += 1;
    },
    "W": () {
      _player.movement.y -= 1;
      _player.animation = _player.upAnimation;
    },
    "S": () {
      _player.movement.y += 1;
      _player.animation = _player.downAnimation;
    },
  };

  MovementObserver(
      Subject<Set<String>, Set<LogicalKeyboardKey>> subject, Player player) {
    _subject = subject;
    subject.addObserver(this);
    _player = player;
  }

  @override
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

  Subject get subject => _subject;
}
