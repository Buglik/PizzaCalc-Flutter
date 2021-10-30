class Pizza {
  String id;
  String name;
  int cost;
  int result;
  String pizzeriaName;
  Shape shape;
  Dimensions dimensions;

  Pizza(this.id, this.name, this.cost, this.result, this.pizzeriaName,
      this.shape, this.dimensions);
}

enum Shape { round, rectangle }

class Dimensions {
  int? diameter;
  int? width;
  int? length;

  Dimensions(this.diameter, this.width, this.length);
}
