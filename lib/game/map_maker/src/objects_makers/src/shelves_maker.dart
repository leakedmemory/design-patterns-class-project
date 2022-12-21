import '../../../../my_game.dart';
import '../../../map_maker.dart';
import '../../objects_factories/factories.dart';

class ShelvesMaker implements Maker<ShelfComponent> {
  late final MyGame _game;
  late final ShelfFactory _factory;

  ShelvesMaker(MyGame game) {
    _game = game;
    _factory = ShelfFactory(game);
  }

  @override
  List<ShelfComponent> make() {
    _game.logger.log('Gerando estantes');
    final fullShelf =
        _factory.createFullShelf(tilePositionX: 5, tilePositionY: 0);
    final emptyShelf =
        _factory.createEmptyShelf(tilePositionX: 7, tilePositionY: 0);

    return [
      ...fullShelf,
      ...emptyShelf,
    ];
  }
}
