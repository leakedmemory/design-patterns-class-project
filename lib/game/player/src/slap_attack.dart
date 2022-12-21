import 'dart:async';

import 'package:flame/widgets.dart';

import '../../attack_strategy/attack_strategy.dart';
import '../player.dart';

class SlapAttack implements AttackStrategy {
  late final Player _player;

  SlapAttack(Player player) {
    _player = player;
  }

  @override
  void attack() {
    final SpriteAnimation oldIdle = _player.animation!;
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

    final SpriteAnimation nowIdle = _player.animation!;
    Timer(const Duration(milliseconds: 500),
        () => _player.animation == nowIdle ? _player.animation = oldIdle : {});
  }
}
