import 'package:splatter_board/Classes/board_type.dart';

import 'climb.dart';

class Board {
  String name;
  BoardType type;
  List<Climb> climbs;

  Board(this.name, this.type, this.climbs);
}
