import 'circle.dart';
import 'rectangle.dart';
import 'square.dart';

void main(List<String> args) {
  Circle circle = Circle(7);
  print('Lingkaran - Luas: ${circle.getArea()}, Keliling: ${circle.getPerimeter()}');

  Rectangle rectangle = Rectangle(10, 15);
  print('Persegi panjang - Luas: ${rectangle.getArea()}, Keliling: ${rectangle.getPerimeter()}');

  Square square = Square(5);
  print('Persegi - Luas: ${square.getArea()}, Keliling: ${square.getPerimeter()}');
}