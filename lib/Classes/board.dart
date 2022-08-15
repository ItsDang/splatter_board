import 'package:splatter_board/Classes/boardType.dart';

import 'climb.dart';

class Board {
  String name;
  boardType type;
  List<Climb> climbs;

  Board(this.name, this.type, this.climbs);
}
