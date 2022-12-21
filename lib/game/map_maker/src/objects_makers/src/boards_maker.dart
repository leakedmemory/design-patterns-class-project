import '../../../../my_game.dart';
import '../../../map_maker.dart';
import '../../objects_factories/factories.dart';

class BoardsMaker implements Maker<BoardComponent> {
  late final MyGame _game;
  late final BoardFactory _factory;

  BoardsMaker(MyGame game) {
    _game = game;
    _factory = BoardFactory(game);
  }

  @override
  List<BoardComponent> make() {
    _game.logger.log('Gerando quadros');
    final pieBoardAtCenter =
        _factory.createPieBoard(tilePositionX: 10, tilePositionY: 0);

    return [
      ...pieBoardAtCenter,
    ];
  }
}
