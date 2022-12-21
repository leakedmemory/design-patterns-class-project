import '../../../../my_game.dart';
import '../../../map_builder.dart';
import '../../objects_facades/facades.dart';

class ChairBuilder implements Builder<ChairComponent> {
  late final MyGame _game;
  late final ChairFacade _facade;

  ChairBuilder(MyGame game) {
    _game = game;
    _facade = ChairFacade(game);
  }

  @override
  List<ChairComponent> make() {
    _game.logger.log('Gerando cadeiras');
    final mainTableChair =
        _facade.createBackwardsChair(tilePositionX: 16, tilePositionY: 2);

    return [
      ...mainTableChair,
    ];
  }
}
