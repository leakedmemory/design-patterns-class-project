import '../../../../my_game.dart';
import '../../../map_maker.dart';
import '../../objects_factories/factories.dart';

class ChairsMaker implements Maker<ChairComponent> {
  late final MyGame _game;
  late final ChairFactory _factory;

  ChairsMaker(MyGame game) {
    _game = game;
    _factory = ChairFactory(game);
  }

  @override
  List<ChairComponent> make() {
    _game.logger.log('Gerando cadeiras');
    final mainTableChair =
        _factory.createBackwardsChair(tilePositionX: 16, tilePositionY: 2);

    return [
      ...mainTableChair,
    ];
  }
}
