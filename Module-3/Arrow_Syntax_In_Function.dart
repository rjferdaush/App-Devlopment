import 'dart:io';
void arrowTest(String? name, int? roll)
  => print("Name: $name\nRoll:$roll"); // return reples by =>

void main(){
  String? name = stdin.readLineSync()??"known";
  int? roll = int.tryParse(stdin.readLineSync()?? "0");


  arrowTest(name, roll);
}