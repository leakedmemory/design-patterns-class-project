import '../../../../my_game.dart';
import '../../../map_maker.dart';
import '../../objects_factories/factories.dart';

class WallsMaker implements Maker<WallComponent> {
  late final MyGame _game;
  late final WallFactory _factory;

  WallsMaker(MyGame game) {
    _game = game;
    _factory = WallFactory(game);
  }

  @override
  List<WallComponent> make() {
    _game.logger.log('Gerando paredes');
    final topWalls = _factory.createTopWalls();
    final bottomWalls = _factory.createBottomWalls();
    final rightWalls = _factory.createRightWalls();
    final leftWalls = _factory.createLeftWalls();

    return [
      ...topWalls,
      ...bottomWalls,
      ...rightWalls,
      ...leftWalls,
    ];
  }
}
