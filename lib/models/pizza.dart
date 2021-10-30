class Pizza {
  String? id;
  String? name;
  int? cost;
  int? result;
  String? pizzeriaName;
  Shape? shape;
  Dimensions? dimensions;
}

enum Shape { round, rectangle }

class Dimensions {
  int? diameter;
  int? width;
  int? length;
}
