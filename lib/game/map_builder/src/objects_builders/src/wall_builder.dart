import '../../../../my_game.dart';
import '../../../map_builder.dart';
import '../../objects_facades/facades.dart';

class WallBuilder implements Builder<WallComponent> {
  late final MyGame _game;
  late final WallFacade _facade;

  WallBuilder(MyGame game) {
    _game = game;
    _facade = WallFacade(game);
  }

  @override
  List<WallComponent> make() {
    _game.logger.log('Gerando paredes');
    final topWalls = _facade.createTopWalls();
    final bottomWalls = _facade.createBottomWalls();
    final rightWalls = _facade.createRightWalls();
    final leftWalls = _facade.createLeftWalls();

    return [
      ...topWalls,
      ...bottomWalls,
      ...rightWalls,
      ...leftWalls,
    ];
  }
}
