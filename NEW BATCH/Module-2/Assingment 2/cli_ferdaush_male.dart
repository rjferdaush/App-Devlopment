import 'dart:io';

Map<String, dynamic> student={};




void main(){
  while(true){
    int? value= int.tryParse(stdin.readLineSync()??"");
    if(value==1){

    }
    else if(value==2){

    }
    else if(value==3){

    }
    else if(value==4){

    }
    else if(value==5){

    }
    else if(value==6){

    }

     else if(value==7){

    }
    else if(value==8){
      break;
    }
    else if(value==null||value<=1||value>=8){
      stdout.write("Please Input in (1 to 8)");
    }

  }
}