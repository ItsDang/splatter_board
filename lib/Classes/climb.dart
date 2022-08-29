import 'package:splatter_board/Classes/grades.dart';

class Climb {
  String path;
  String name;
  Grades grade;
  int angle;
  List<int> start;
  List<int> hands;
  List<int> feet;
  int end;

  Climb(this.path, this.name, this.grade, this.angle, this.start, this.hands,
      this.feet, this.end);
}
