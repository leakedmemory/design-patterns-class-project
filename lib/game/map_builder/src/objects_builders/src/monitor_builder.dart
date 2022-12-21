import '../../../../my_game.dart';
import '../../../map_builder.dart';
import '../../objects_facades/facades.dart';

class MonitorBuilder implements Builder<MonitorComponent> {
  late final MyGame _game;
  late final MonitorFacade _facade;

  MonitorBuilder(MyGame game) {
    _game = game;
    _facade = MonitorFacade(game);
  }

  @override
  List<MonitorComponent> make() {
    _game.logger.log('Gerando monitores');
    final squared2VerticalBlackMonitors = _facade
        .createThreeVerticalBlackMonitors(tilePositionX: 15, tilePositionY: 6);
    final squared2VerticalWhiteMonitors = _facade
        .createThreeVerticalWhiteMonitors(tilePositionX: 16, tilePositionY: 6);
    final squared2RightDiagonalBlackMonitor = _facade
        .createRightDiagonalBlackMonitor(tilePositionX: 17, tilePositionY: 6);
    final squared2RightDiagonalWhiteMonitor = _facade
        .createRightDiagonalWhiteMonitor(tilePositionX: 17, tilePositionY: 7);

    final mainTableMonitors = _facade.createThreeHorizontalWhiteMonitors(
        tilePositionX: 15, tilePositionY: 1);
    final mainTableKeyboard =
        _facade.createHorizontalKeyboard(tilePositionX: 16, tilePositionY: 2);

    final verticalTableNotebook =
        _facade.createDiagonalNotebook(tilePositionX: 20, tilePositionY: 8);

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
