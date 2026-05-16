import 'dart:async';

Future<String> fetchUsername() {
  return Future.delayed(
    Duration(seconds: 2),
    () => "Ayaan",
  );
}

Future<int> fetchScore() {
  return Future.delayed(
    Duration(seconds: 1),
    () => 99,
  );
}

Future<void> saveToDisk() {
  return Future.delayed(
    Duration(seconds: 1),
    () => print("Saved!"),
  );
}

void main() async {
  Future<String> name  = fetchUsername();  // এখনো অপেক্ষা করছে
  Future<int>    score = fetchScore();     // এখনো অপেক্ষা করছে
  Future<void>   saved = saveToDisk();     // এখনো অপেক্ষা করছে

  print("Futures created, waiting...");

  print(await name);   // 2 সেকেন্ড পর → Ayaan
  print(await score);  // 1 সেকেন্ড পর → 99
  await saved;         // Saved! print হবে 
  // & ai khane void function er vitorer print kora ase 
}