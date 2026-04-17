import 'dart:io';
void main(){
  Map<String,dynamic> info = {};

  while(true){
    String? keys=stdin.readLineSync()??"NULL";
    if(keys.isEmpty) break;
    var input=stdin.readLineSync();
    info[keys]={input};
  }
  print(info);
}