import 'dart:math';
import 'shape.dart';

class Circle implements Shape {
  int r;

  Circle(this.r);
  @override
  getArea() {
    int rumus = (pi * r * r).toInt();
    return rumus;
  }

  @override
  getPerimeter() {
    int rumus = (2 * pi * r).toInt();
    return rumus;
  }
}
