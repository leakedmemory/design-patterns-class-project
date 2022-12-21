import '../../../../my_game.dart';
import '../../../map_builder.dart';
import '../../objects_facades/facades.dart';

class ShelfBuilder implements Builder<ShelfComponent> {
  late final MyGame _game;
  late final ShelfFacade _facade;

  ShelfBuilder(MyGame game) {
    _game = game;
    _facade = ShelfFacade(game);
  }

  @override
  List<ShelfComponent> make() {
    _game.logger.log('Gerando estantes');
    final fullShelf =
        _facade.createFullShelf(tilePositionX: 5, tilePositionY: 0);
    final emptyShelf =
        _facade.createEmptyShelf(tilePositionX: 7, tilePositionY: 0);

    return [
      ...fullShelf,
      ...emptyShelf,
    ];
  }
}
