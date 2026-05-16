import 'dart:io';

Future<String> fetchUsername(String input){
  return Future.delayed(Duration(seconds: 2),
    // ()=> input=="Ferdaush" ? "Ferdaush" : throw Exception("User Not Found");
    (){ 
    if(input=="Ferdaush"){
      return "Ferdaush";
    }
    else{
      throw Exception("User Not Found");
    }
  });
}

void main() async{
String? name1 =stdin.readLineSync()??"Unknown";

print("Hello");
try{
  final name = await fetchUsername(name1);
  print(name);
}
catch(symbol){
  print("Error: $symbol");
}

print("Wellcome");

}