import 'package:flutter/services.dart';

import 'package:design_patterns_project/game/utils/observer.dart';

class CustomKeyboardListener
    implements Subject<Set<String>, Set<LogicalKeyboardKey>> {
  final List<Observer<Set<String>>> _observers = [];
  static late Set<LogicalKeyboardKey> _keysPressed;

  @override
  void addObserver(Observer<Set<String>> observer) {
    _observers.add(observer);
  }

  @override
  void removeObserver(Observer<Set<String>> observer) {
    _observers.remove(observer);
  }

  @override
  void notifyObservers() {
    final keysLabel = _parseInput();
    for (final observer in _observers) {
      observer.update(keysLabel);
    }
  }

  Set<String> _parseInput() {
    final Set<String> keysLabel = {};
    for (final key in _keysPressed) {
      keysLabel.add(key.keyLabel);
    }

    return keysLabel;
  }

  @override
  Set<LogicalKeyboardKey> get state => _keysPressed;
  @override
  set state(Set<LogicalKeyboardKey> newState) => _keysPressed = newState;
}
