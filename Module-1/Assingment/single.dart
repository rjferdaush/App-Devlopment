import 'dart:io';
void main(){
  // _________________________________
  // Assignment – Dart Basics Practice
  //__________________________________

  // _________________________________
  // Part 1: Basic Output (Hello Dart)
  //__________________________________
  print("Hello Dart!\nWelcome to Flutter Devlopment.");

  // _________________________________
  // Part 2: Variables & Data Types
  //__________________________________
  String name1 ="Ferdaush Bin Islam";
  int age1 = 25;
  double height = 5.11;
  bool isStudent = true;
  if(isStudent){
    print("Name:$name1\nAge$age1\nHeight:$height");
  }

  // _________________________________
  // Part 3: Nullability
  //__________________________________
  print("Enter A String:");
  String? value = stdin.readLineSync();
  if(value==null || value.isEmpty){
    print("Value is null");
  }
  else{
    print("Value is available");
  }

  // _________________________________
  // Part 4: Operators
  //__________________________________
  int a = 10, b =3;
  print("Addition:-${a+b}");
  print("Subtraction:-${a-b}");
  print("Multiplication:-${a*b}");
  print("Division:-${a/b}");
  print("Modulus:-${a%b}");
  // _________________________________
  // Part 5: String Interpolation
  //__________________________________
  var name2="Ferdaush";
  var age2 = 24;
  print("My name is $name2 and I am $age2 years old.");

  // _________________________________
  // Part 6: Control Flow (if-else)
  //__________________________________
  print("Enter Marks in 0 to 100");
  int? marks=int.tryParse(stdin.readLineSync()??"0");
  if(marks!= null && marks>=80){
    print("A+");
  }
  else if(marks!= null && 70<= marks  && marks<=79){
    print("A");
  }
  else if(marks!= null && 60<= marks && marks<=69){
    print("A-");
  }
  else if(marks!= null && 50<= marks && marks<=59){
    print("B");
  }
  else{
    print("Fail");
  }

  // _________________________________
  // Part 7: Bonus Challenge ⭐
  //__________________________________
  print("Enter A Number:");
  int? n= int.tryParse(stdin.readLineSync() ??"0");

  if(n!=null && n%2==0){
    print("Even");
  }
  else{
    print("Odd");
  }
}