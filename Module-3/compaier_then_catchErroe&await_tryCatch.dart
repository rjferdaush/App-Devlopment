import 'dart:async';

Future<String> fetchUsername(String name) {
  return Future.delayed(Duration(seconds: 2), () {
    if (name == "Ayaan") {
      return "Ayaan";
    } else {
      throw Exception("Name ভুল!");
    }
  });
}

void main() async {

  // ── Style 1: .then().catchError() ──
  print("--- Style 1 ---");

  fetchUsername("Ayaan")
    .then((name) => print("Success: $name"))
    .catchError((e) => print("Error: $e"));

  fetchUsername("Rahim")
    .then((name) => print("Success: $name"))
    .catchError((e) => print("Error: $e"));

  // 2 সেকেন্ড অপেক্ষা করো Style 1 শেষ হওয়ার জন্য
  await Future.delayed(Duration(seconds: 3));

  // ── Style 2: async/await + try/catch ──
  print("\n--- Style 2 ---");

  try {
    String name = await fetchUsername("Ayaan");
    print("Success: $name");
  } catch (e) {
    print("Error: $e");
  }

  try {
    String name = await fetchUsername("Rahim");
    print("Success: $name");
  } catch (e) {
    print("Error: $e");
  }
}