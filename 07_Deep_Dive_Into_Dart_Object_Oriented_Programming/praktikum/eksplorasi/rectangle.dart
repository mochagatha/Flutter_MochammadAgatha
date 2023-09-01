import 'shape.dart';

class Rectangle implements Shape {
  final int p;
  final int l;

  Rectangle(this.p, this.l);

  @override
  getArea() {
    return p * l;
  }

  @override
  getPerimeter() {
    return 2 * (p + l);
  }
}
