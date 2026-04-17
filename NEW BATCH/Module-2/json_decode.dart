import 'dart:convert';
void main() {
// Simulated API response
  String rawJson = '{"name":"Ayaan","score":92,"isPremium":true}';
  Map<String, dynamic> user = jsonDecode(rawJson);

  bool isPremium = user["isPremium"] ?? false;

// Build personalised menu with collection if + spread
  List<String> baseItems = ["Home", "Profile"];
  List<String> menu = [
    ...baseItems,
    if (isPremium) "Premium Zone",
    "Settings",
  ];

  print("Welcome, ${user['name']}!");
  print("Menu: $menu");
}