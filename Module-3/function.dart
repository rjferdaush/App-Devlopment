  void testfunction(String name){
    print("Name: $name");
  }

  void calculate({required String name, required int n}){
    print("Name:$name\nRoll:$n");

  }
void main(){
  // testfunction("Ferdaush");
  calculate(name: "Ferdaush", n: 100);


}