import 'package:flame/input.dart';

import '../../../../my_game.dart';
import '../../../map_builder.dart';
import 'object_facade.dart';

class MonitorFacade
    implements ObjectFacade<MonitorComponent, MonitorComponentType> {
  late final MyGame _game;
  static const int _defaultPriority = 6;

  MonitorFacade(MyGame game) {
    _game = game;
  }

  @override
  MonitorComponent createSpriteComponent(
      {required MonitorComponentType type,
      required double tilePositionX,
      required double tilePositionY,
      required int priority}) {
    return MonitorComponent(_game, type,
        Vector2(tilePositionX, tilePositionY) * _game.tileSizeInPixels,
        priority: priority);
  }

  List<MonitorComponent> createThreeVerticalBlackMonitors(
      {required double tilePositionX,
      required double tilePositionY,
      int priority = _defaultPriority}) {
    List<MonitorComponent> monitor = [];
    monitor.add(createSpriteComponent(
        type: MonitorComponentType.threeVerticalBlackMonitorsTop,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: priority));
    monitor.add(createSpriteComponent(
        type: MonitorComponentType.threeVerticalBlackMonitorsMiddle,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 1,
        priority: priority));
    monitor.add(createSpriteComponent(
        type: MonitorComponentType.threeVerticalBlackMonitorsBottom,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 2,
        priority: priority));

    return monitor;
  }

  List<MonitorComponent> createThreeVerticalWhiteMonitors(
      {required double tilePositionX,
      required double tilePositionY,
      int priority = _defaultPriority}) {
    List<MonitorComponent> monitor = [];
    monitor.add(createSpriteComponent(
        type: MonitorComponentType.threeVerticalWhiteMonitorsTop,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: priority));
    monitor.add(createSpriteComponent(
        type: MonitorComponentType.threeVerticalWhiteMonitorsMiddle,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 1,
        priority: priority));
    monitor.add(createSpriteComponent(
        type: MonitorComponentType.threeVerticalWhiteMonitorsBottom,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 2,
        priority: priority));

    return monitor;
  }

  List<MonitorComponent> createRightDiagonalBlackMonitor(
      {required double tilePositionX,
      required double tilePositionY,
      int priority = _defaultPriority}) {
    List<MonitorComponent> monitor = [];
    monitor.add(createSpriteComponent(
        type: MonitorComponentType.rightDiagonalBlackMonitor,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: priority));

    return monitor;
  }

  List<MonitorComponent> createRightDiagonalWhiteMonitor(
      {required double tilePositionX,
      required double tilePositionY,
      int priority = _defaultPriority}) {
    List<MonitorComponent> monitor = [];
    monitor.add(createSpriteComponent(
        type: MonitorComponentType.rightDiagonalWhiteMonitor,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: priority));

    return monitor;
  }

  List<MonitorComponent> createThreeHorizontalWhiteMonitors({
    required double tilePositionX,
    required double tilePositionY,
  }) {
    List<MonitorComponent> monitor = [];
    monitor.add(createSpriteComponent(
        type: MonitorComponentType.threeHorizontalWhiteMonitorsLeft,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: _defaultPriority));
    monitor.add(createSpriteComponent(
        type: MonitorComponentType.threeHorizontalWhiteMonitorsMiddle,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY,
        priority: _defaultPriority));
    monitor.add(createSpriteComponent(
        type: MonitorComponentType.threeHorizontalWhiteMonitorsRight,
        tilePositionX: tilePositionX + 2,
        tilePositionY: tilePositionY,
        priority: _defaultPriority));

    return monitor;
  }

  MonitorComponent createHorizontalKeyboard({
    required double tilePositionX,
    required double tilePositionY,
  }) {
    return createSpriteComponent(
        type: MonitorComponentType.horizontalKeyboard,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: _defaultPriority);
  }

  List<MonitorComponent> createDiagonalNotebook({
    required double tilePositionX,
    required double tilePositionY,
  }) {
    List<MonitorComponent> monitor = [];
    monitor.add(createSpriteComponent(
        type: MonitorComponentType.diagonalNotebookTop,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: _defaultPriority));
    monitor.add(createSpriteComponent(
        type: MonitorComponentType.diagonalNotebookBottom,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));

    return monitor;
  }
}
