import 'board.dart';

class Gym {
  String name;
  double latitude;
  double longitude;
  List<Board> boards;
  String owner; // maybe make int? as a key to owner
  bool private; // do not save to global db

  Gym(this.name, this.latitude, this.longitude, this.boards, this.owner,
      this.private);
}
