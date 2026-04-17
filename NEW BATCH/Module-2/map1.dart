import 'dart:io';
void main() {
  int? n = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;

  for (int i = 0; i <= n; i++) {
    String? name = stdin.readLineSync() ?? "Unknown";
    int? roll = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;
    Map<String, dynamic> info = {
      "Name": name,
      "Age": roll
    };
    print(info);
  }
}
