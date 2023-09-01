import 'shape.dart';

class Square implements Shape {
  int s;

  Square(this.s);

  @override
  getArea() {
    return s * s;
  }

  @override
  getPerimeter() {
    return 4 * s;
  }
}
