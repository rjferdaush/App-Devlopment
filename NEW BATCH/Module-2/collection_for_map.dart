void main(){
  List<String> names  = ["Ayaan", "Sara", "Rafi"];
  List<int>    scores = [88, 95, 74];

  Map<String, int> report = {
    for (int i = 0; i < names.length; i++)
      names[i]: scores[i],
  };

  print(report);
}