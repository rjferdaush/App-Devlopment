import 'dart:math';

// ── Problem 1: Student class ──────────────────────────────────────
class Student {
  String name;
  int roll;

  Student(this.name, this.roll);

  void displayInfo() {
    print('Name : $name');
    print('Roll : $roll\n');
  }
}

// ── Problem 2: Inheritance ────────────────────────────────────────
class Person {
  String name;

  Person(this.name);
}

class Teacher extends Person {
  String subject;

  Teacher(String name, this.subject) : super(name);
}


// ── Problem 3: Abstract class + getter/setter ─────────────────────
abstract class Shape {
  double _area = 0;

  double area();

  set setArea(double value) {
    _area = value;
  }

  double get getArea => _area;
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() {
    setArea = pi * radius * radius;
    return getArea;
  }
}

void main() {
// ── Problem 1: Student class ──────────────────────────────────────
  Student s1 = Student('Ferdaush', 101);
  s1.displayInfo();


// ── Problem 2: Inheritance ────────────────────────────────────────
  Teacher t1 = Teacher('Mr. Rahman', 'Flutter Development');
  print('Name    : ${t1.name}');
  print('Subject : ${t1.subject}\n');



// ── Problem 3: Abstract class + getter/setter ─────────────────────
  Circle c1 = Circle(7);
  c1.area();
  print('Radius : ${c1.radius}');
  print('Area   : ${c1.getArea.toStringAsFixed(2)}');
}
