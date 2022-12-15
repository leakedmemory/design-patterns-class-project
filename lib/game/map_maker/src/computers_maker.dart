import 'package:flame/input.dart';

import '../../my_game.dart';
import 'abstractions/component_maker.dart';
import 'components/computer.dart';

class ComputersMaker implements ComponentMaker<Computer, ComputerType> {
  late final MyGame _game;

  ComputersMaker(MyGame game) {
    _game = game;
  }

  @override
  Computer setSpriteTileOnMap(ComputerType type, double x, double y,
      {int priority = 0}) {
    return Computer(_game, type,
        Vector2(_game.tileSizeInPixels * x, _game.tileSizeInPixels * y),
        priority: priority);
  }

  @override
  List<Computer> make() {
    List<Computer> computers = [
      ..._squaredTable1Monitors(),
      ..._mainTableComputer(),
      ..._verticalTableComputer(),
    ];

    return computers;
  }

  List<Computer> _squaredTable1Monitors() {
    List<Computer> monitors = [];
    monitors.add(setSpriteTileOnMap(
        ComputerType.threeVerticalBlackMonitorsTop, 15, 6,
        priority: 2));
    monitors.add(setSpriteTileOnMap(
        ComputerType.threeVerticalWhiteMonitorsTop, 16, 6,
        priority: 2));
    monitors.add(setSpriteTileOnMap(
        ComputerType.rightDiagonalBlackMonitor, 17, 6,
        priority: 2));
    monitors.add(setSpriteTileOnMap(
        ComputerType.threeVerticalBlackMonitorsMiddle, 15, 7,
        priority: 2));
    monitors.add(setSpriteTileOnMap(
        ComputerType.threeVerticalWhiteMonitorsMiddle, 16, 7));
    monitors.add(setSpriteTileOnMap(
        ComputerType.threeVerticalBlackMonitorsBottom, 15, 8));
    monitors.add(setSpriteTileOnMap(
        ComputerType.threeVerticalWhiteMonitorsBottom, 16, 8));
    monitors
        .add(setSpriteTileOnMap(ComputerType.rightDiagonalWhiteMonitor, 17, 7));

    return monitors;
  }

  List<Computer> _mainTableComputer() {
    List<Computer> computer = [];
    computer.add(setSpriteTileOnMap(
        ComputerType.threeHorizontalWhiteMonitorsLeft, 15, 1));
    computer.add(setSpriteTileOnMap(
        ComputerType.threeHorizontalWhiteMonitorsMiddle, 16, 1));
    computer.add(setSpriteTileOnMap(
        ComputerType.threeHorizontalWhiteMonitorsRight, 17, 1));
    computer.add(setSpriteTileOnMap(ComputerType.horizontalKeyboard, 16, 2));

    return computer;
  }

  List<Computer> _verticalTableComputer() {
    List<Computer> computer = [];
    computer.add(setSpriteTileOnMap(ComputerType.diagonalNotebookTop, 20, 8));
    computer
        .add(setSpriteTileOnMap(ComputerType.diagonalNotebookBottom, 20, 9));

    return computer;
  }
}
