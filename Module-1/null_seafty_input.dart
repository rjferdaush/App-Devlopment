import 'dart:io';
void main(){
  // stdin.readLineSync("hello");


  int? x; // ? possible that x can be null
  x = int.tryParse(stdin.readLineSync()!); // ! sure that not null
  x??=0; // ??= if null then assin some value
  print(x);

  String? num1, num2 ;
  num1=stdin.readLineSync()??"unknown";
  print(num1);

  num2=stdin.readLineSync()??"Unknown";
  print(num2);

  num1 ??="Unknown";
  print(num1);



}