import '../../../../my_game.dart';
import '../../../map_maker.dart';
import '../../objects_factories/factories.dart';

class MonitorsMakers implements Maker<MonitorComponent> {
  late final MyGame _game;
  late final MonitorFactory _factory;

  MonitorsMakers(MyGame game) {
    _game = game;
    _factory = MonitorFactory(game);
  }

  @override
  List<MonitorComponent> make() {
    _game.logger.log('Gerando monitores');
    final squared2VerticalBlackMonitors = _factory
        .createThreeVerticalBlackMonitors(tilePositionX: 15, tilePositionY: 6);
    final squared2VerticalWhiteMonitors = _factory
        .createThreeVerticalWhiteMonitors(tilePositionX: 16, tilePositionY: 6);
    final squared2RightDiagonalBlackMonitor = _factory
        .createRightDiagonalBlackMonitor(tilePositionX: 17, tilePositionY: 6);
    final squared2RightDiagonalWhiteMonitor = _factory
        .createRightDiagonalWhiteMonitor(tilePositionX: 17, tilePositionY: 7);

    final mainTableMonitors = _factory.createThreeHorizontalWhiteMonitors(
        tilePositionX: 15, tilePositionY: 1);
    final mainTableKeyboard =
        _factory.createHorizontalKeyboard(tilePositionX: 16, tilePositionY: 2);

    final verticalTableNotebook =
        _factory.createDiagonalNotebook(tilePositionX: 20, tilePositionY: 8);

    return [
      ...squared2VerticalBlackMonitors,
      ...squared2VerticalWhiteMonitors,
      ...squared2RightDiagonalBlackMonitor,
      ...squared2RightDiagonalWhiteMonitor,
      ...mainTableMonitors,
      mainTableKeyboard,
      ...verticalTableNotebook,
    ];
  }
}
