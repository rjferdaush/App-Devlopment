import 'dart:io';
//----NullAbale Functions----
void nullabaleInfo({String? name, int? age}){
  print("Name:$name\nAge:$age");
}

//----RequardAbale Function----
void requaredInfo({required name, required age}){
  print("Name:$name\nAge:$age");
}

//----defaultValue Function----
void defaultValueInfo({required  name, int age = 0}){
  print("Name:$name\nAge:$age");
}


void main(){
//---Nullable Function---
//   String? name = stdin.readLineSync()??"UNKNOWN";
//   int? num = int.tryParse(stdin.readLineSync()??"0");
//   nullabaleInfo(name: name, age:num);
  nullabaleInfo(name: "Ferdaush", age: 25);

//----RequardAbale Function----
  requaredInfo(name: "Ferdaush", age: 25);

//----defaultValue Function----
  defaultValueInfo(name: "Ferdaush"); // age = 0 


}