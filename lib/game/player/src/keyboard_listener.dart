import 'package:flutter/services.dart';

import 'movement_observer.dart';

class CustomKeyboardListener {
  final List<MovementObserver> _observers = [];
  late Set<LogicalKeyboardKey> keysPressed;

  void addObserver(MovementObserver observer) {
    _observers.add(observer);
  }

  void removeObserver(MovementObserver observer) {
    _observers.remove(observer);
  }

  void notifyObservers() {
    final keysLabel = _parseInput();
    for (final observer in _observers) {
      observer.update(keysLabel);
    }
  }

  Set<String> _parseInput() {
    final Set<String> keysLabel = {};
    for (final key in keysPressed) {
      keysLabel.add(key.keyLabel);
    }

    return keysLabel;
  }
}
