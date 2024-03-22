import 'dart:io';

// A class that implements an interface for a shape
abstract class Shape {
  double calculateArea();
}

// Parent class for shapes
class Geometry {
  void printInfo() {
    print("This is a geometric shape.");
  }
}

// Rectangle class implementing the Shape interface and overrides an inherited method
class Rectangle extends Geometry implements Shape {
  double length;
  double width;

  Rectangle(this.length, this.width);

  @override
  double calculateArea() {
    return length * width;
  }
}

// Circle class implementing the Shape interface and overrides an inherited method
class Circle extends Geometry implements Shape {
  double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return 3.14 * radius * radius;
  }
}

// An instance of a class that is initialized with data from a file
class ShapeInitializer {
  List<Shape> shapes = [];

  void initializeFromFile(String fileName) {
    File file = File(fileName);
    List<String> lines = file.readAsLinesSync();

    for (var line in lines) {
      var parts = line.split(',');
      if (parts[0] == 'rectangle') {
        shapes.add(Rectangle(double.parse(parts[1]), double.parse(parts[2])));
      } else if (parts[0] == 'circle') {
        shapes.add(Circle(double.parse(parts[1])));
      }
    }
  }
}

void main() {
  // Initialize shapes from a file
  ShapeInitializer shapeInitializer = ShapeInitializer();
  shapeInitializer.initializeFromFile('shapes.txt');

  // A method that demonstrates the use of a loop
  for (var shape in shapeInitializer.shapes) {
    if (shape is Rectangle) {
      print("This is a rectangle.");
    } else if (shape is Circle) {
      print("This is a circle.");
    }
    print("Area: ${shape.calculateArea()}");
    print("");
  }
}
