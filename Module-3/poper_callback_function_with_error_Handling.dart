Future<String> fetchUsername(String name) {
  return Future.delayed(Duration(seconds: 2), () {
    if (name == "Ayaan") {
      return name;                        // ✅ then() এ যাবে
    } else {
      throw Exception("Name ভুল!");       // ❌ catchError() এ যাবে
    }
  });
}

void main() {
  fetchUsername("Ayaan")
    .then((name) => print("Welcome, $name!"))       // ✅ এখানে আসবে
    .catchError((e) => print("ERROR: $e"));

  fetchUsername("Rahim")
    .then((name) => print("Welcome, $name!"))
    .catchError((e) => print("ERROR: $e"));          // ❌ এখানে আসবে
}