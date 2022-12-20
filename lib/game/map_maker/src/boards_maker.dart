import 'package:flame/input.dart';

import '../../my_game.dart';
import 'abstractions/component_maker.dart';
import 'components/board.dart';

class BoardsMaker implements ComponentMaker<Board, BoardType> {
  late final MyGame _game;

  BoardsMaker(MyGame game) {
    _game = game;
  }

  @override
  Board setSpriteTileOnMap(BoardType type, double x, double y,
      {int priority = 0}) {
    return Board(_game, type,
        Vector2(_game.tileSizeInPixels * x, _game.tileSizeInPixels * y),
        priority: priority);
  }

  @override
  List<Board> make() {
    _game.logger.log('Gerando quadros');
    List<Board> boards = [
      ..._createPieBoard(),
    ];

    return boards;
  }

  List<Board> _createPieBoard() {
    List<Board> board = [];
    board.add(setSpriteTileOnMap(BoardType.pieTopLeft, 10, 0));
    board.add(setSpriteTileOnMap(BoardType.pieTopRight, 11, 0));
    board.add(setSpriteTileOnMap(BoardType.pieBottomLeft, 10, 1));
    board.add(setSpriteTileOnMap(BoardType.pieBottomRight, 11, 1));

    return board;
  }
}
