import 'package:flame/input.dart';

import '../../components/components.dart';
import '../../../../my_game.dart';
import 'object_facade.dart';

class BoardFacade implements ObjectFacade<BoardComponent, BoardComponentType> {
  late final MyGame _game;
  static const int _defaultPriority = 6;

  BoardFacade(MyGame game) {
    _game = game;
  }

  @override
  BoardComponent createSpriteComponent(
      {required BoardComponentType type,
      required double tilePositionX,
      required double tilePositionY,
      required int priority}) {
    return BoardComponent(_game, type,
        Vector2(tilePositionX, tilePositionY) * _game.tileSizeInPixels,
        priority: priority);
  }

  List<BoardComponent> createPieBoard(
      {required double tilePositionX, required double tilePositionY}) {
    List<BoardComponent> board = [];
    board.add(createSpriteComponent(
        type: BoardComponentType.pieTopLeft,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY,
        priority: _defaultPriority));
    board.add(createSpriteComponent(
        type: BoardComponentType.pieTopRight,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY,
        priority: _defaultPriority));
    board.add(createSpriteComponent(
        type: BoardComponentType.pieBottomLeft,
        tilePositionX: tilePositionX,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));
    board.add(createSpriteComponent(
        type: BoardComponentType.pieBottomRight,
        tilePositionX: tilePositionX + 1,
        tilePositionY: tilePositionY + 1,
        priority: _defaultPriority));

    return board;
  }
}
