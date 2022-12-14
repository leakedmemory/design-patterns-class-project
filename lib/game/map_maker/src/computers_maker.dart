import 'package:flame/input.dart';

import '../../my_game.dart';
import 'abstractions/maker.dart';
import 'components/computer.dart';

class ComputersMaker implements Maker<Computer> {
  late final MyGame _game;

  ComputersMaker(MyGame game) {
    _game = game;
  }

  Computer _setSpriteTileOnMap(ComputerType type, double x, double y) {
    return Computer(_game, type,
        Vector2(_game.tileSizeInPixels * x, _game.tileSizeInPixels * y));
  }

  @override
  List<Computer> make() {
    List<Computer> computers = [
      ..._squaredTable1Monitors(),
    ];

    return computers;
  }

  List<Computer> _squaredTable1Monitors() {
    List<Computer> monitors = [];
    monitors.add(
        _setSpriteTileOnMap(ComputerType.threeVerticalBlackMonitorsTop, 15, 6));
    monitors.add(_setSpriteTileOnMap(
        ComputerType.threeVerticalBlackMonitorsMiddle, 15, 7));
    monitors.add(_setSpriteTileOnMap(
        ComputerType.threeVerticalBlackMonitorsBottom, 15, 8));
    monitors.add(
        _setSpriteTileOnMap(ComputerType.threeVerticalWhiteMonitorsTop, 16, 6));
    monitors.add(_setSpriteTileOnMap(
        ComputerType.threeVerticalWhiteMonitorsMiddle, 16, 7));
    monitors.add(_setSpriteTileOnMap(
        ComputerType.threeVerticalWhiteMonitorsBottom, 16, 8));
    monitors.add(
        _setSpriteTileOnMap(ComputerType.rightDiagonalBlackMonitor, 17, 6));
    monitors.add(
        _setSpriteTileOnMap(ComputerType.rightDiagonalWhiteMonitor, 17, 7));

    return monitors;
  }
}
