void main() {
  List<int> scores = [88, 45, 95, 52, 74];
  bool showAll = false;

// Only include scores >= 70, or all if showAll is true
  List<int> filtered = [
    if (showAll)
      ...scores
    else
      for (var s in scores) if (s >= 70) s,
  ];

  print(filtered);
}