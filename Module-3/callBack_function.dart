Future<String> fetchUsername() =>
    Future.delayed(Duration(seconds: 2), () => "Ayaan");

void main() {
  print("1. asking for username…");

  fetchUsername()  // run hobe 
  // code thik thakle cholbe 
  .then((name) {
    print("3. got: $name");
  })
  // code vhull hole cholbe na 
  .catchError((error){
    print("ERROE");
  });

  print("2. main() keeps going — not blocked!");
}
