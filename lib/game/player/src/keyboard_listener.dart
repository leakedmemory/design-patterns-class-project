import 'package:flutter/services.dart';

import 'actions_observer.dart';

class CustomKeyboardListener {
  final List<ActionsObserver> _observers = [];
  late Set<LogicalKeyboardKey> keysPressed;

  void addObserver(ActionsObserver observer) {
    _observers.add(observer);
  }

  void removeObserver(ActionsObserver observer) {
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
