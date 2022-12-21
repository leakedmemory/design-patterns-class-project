import '../../../../my_game.dart';
import '../../../map_builder.dart';
import '../../objects_facades/facades.dart';

class BoardBuilder implements Builder<BoardComponent> {
  late final MyGame _game;
  late final BoardFacade _facade;

  BoardBuilder(MyGame game) {
    _game = game;
    _facade = BoardFacade(game);
  }

  @override
  List<BoardComponent> make() {
    _game.logger.log('Gerando quadros');
    final pieBoardAtCenter =
        _facade.createPieBoard(tilePositionX: 10, tilePositionY: 0);

    return [
      ...pieBoardAtCenter,
    ];
  }
}
