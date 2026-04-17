import 'dart:io';
void main(){

  // -----------------------------
  // Step 2: Practicing Lists (Ordered Data)
  // -----------------------------
  List<String> growable = [];
  List<int> fixed_length_list = List.filled(3, 0);
  fixed_length_list[0]=10;
  fixed_length_list[1]=20;
  fixed_length_list[2]=30;
  print("Fixed Length List: ${fixed_length_list}");

  growable.add("Ferdaush");
  growable.add("Jhumur");
  growable.add("MA");
  growable.add("BABA");
  growable.add("Unknown");
  print("After Add value In Growable List:${growable}");

  growable.remove("Unknown");
  print("After Remove value(Unknown) In Growable List:${growable}");

  growable.insert(2, "Happy Family");
  print("After Insert value(Happy Family) In Growable List:${growable}");

  growable.sort();
  print("After Sorting value In Growable List:${growable}");



  // -----------------------------
  // Step 3: Practicing Sets (Unique Elements)
  // -----------------------------


  Set<dynamic> set = {"Ferdaush", 25, "Jhumur",24,  25, 24, "Jhumur"};
  print("\nOriginal Set Remove Duplicates Value:");
  print(set);

  set.add(1);
  print("After Adding Value:");
  print(set);

  set.remove(1);
  print("After Removing Value:");
  print(set);

  Set<int> A = {1, 2, 3,};
  Set<int> B = {3, 4, 6};
  print("Set A: $A\nSet B: $B");
  print("Union Of Set A & Set B :${A.union(B)}");
  print("Intersection Of Set A & Set B :${A.intersection(B)}");
  print("Difference Of Set A & Set B :${A.difference(B)}");

  // -----------------------------
  // Step 4: Practicing Maps (Key-Value Pairs)
  // -----------------------------

  Map<dynamic,dynamic> student1={};
  while(true) {
    print("Enter Name:");
    String?name = stdin.readLineSync() ?? "Unknown";
    print("Enter ID:");
    int?id = int.tryParse(stdin.readLineSync() ?? "0");
    print("Enter Age:");
    int?age = int.tryParse(stdin.readLineSync() ?? "0");
    print("Enter Gread:");
    String?gread = stdin.readLineSync() ?? "Unknown";
    print("Enter Mejor Subject:");
    String?subject = stdin.readLineSync() ?? "Unknown";

    student1[id] = {
        "Name": name,
        "Age": age,
        "Gread": gread,
        "Mejor Subject": subject,

    };

    print("Have Any More Student(y/n):");
    String?k = stdin.readLineSync() ?? "Unknown";
    if (k.isEmpty || k == Null) {
      continue;
    }
    else {
      break;
    }
  }
  print("$student1\n");

  print("Enter Access Id:");
  int?id = int.tryParse(stdin.readLineSync() ?? "0");
  print("ID Is $id: ${student1[id]}");


  // -----------------------------
  // Step 5: Working with Nested Maps
  // -----------------------------
  Map<int, Map<String, String>> student2 = {
    101: {
      "name": "Ferdaush",
      "grade": "A"
    },
    102: {
      "name": "Jhumur",
      "grade": "B+"
    },
    103: {
      "name": "Happy Family",
      "grade": "A+"
    }
  };

  print(student2[102]?["name"]);
  print(student2[102]?["grade"]);

  // -----------------------------
  // Step 6: Using Map methods and collection operators
  // -----------------------------
  Map<int, String> student3 = {
    101: "Ferdaush",
    102: "Jhumur",
    103: "Happy Family"
  };


  print(student3.keys);
  print(student3.values);

  // -----------------------------
  // Step 7: Planning the Student Info System mini project
  // -----------------------------
  List<Map<String, dynamic>> student4 = [];


  student4.add({
    "name": "Ferdaush",
    "roll": 101,
    "grade": "A"
  });

  student4.add({
    "name": "Jhumur",
    "roll": 102,
    "grade": "B+"
  });


  for (var student in student4) {
    print(student);
  }


  for (var student in student4) {
    if (student["roll"] == 101) {
      student["grade"] = "A+";
    }
  }

  student4.removeWhere((student) => student["roll"] == 102);

  print("After update/remove:");
  for (var student in student4) {
    print(student);
  }
  // -----------------------------
  // Step 8: Implementing the Student Info System
  // -----------------------------
  List<Map<String, dynamic>> student5 = [
    {"name": "Ferdaush", "roll": 101, "grade": "A"},
    {"name": "Jhumur", "roll": 102, "grade": "B+"}
  ];

  student5.add({
    "name": "Sadia",
    "roll": 103,
    "grade": "A+"
  });

  for (var student in student5) {
    print("Name: ${student["name"]}, Roll: ${student["roll"]}, Grade: ${student["grade"]}");
  }
  // -----------------------------
  // Step 9: Testing the system
  // -----------------------------
  List<String> names = ["Ferdaush", "Jhumur", "Happy Family"];
  names.add("Ferdaush");
  print("List: $names");

  // SET test (uniqueness)
  Set<String> uniqueNames = {"Ferdaush", "Jhumur", "Happy Family"};
  uniqueNames.add("Ferdaush");
  print("Set: $uniqueNames");


  Map<int, String> student6 = {
    101: "Ferdaush",
    102: "Jhumur"
  };

  print("Map name for roll 101: ${student6[101]}");

  List<Map<String, dynamic>> studentInfo = [
    {"name": "Ferdaush", "roll": 101, "grade": "A"},
    {"name": "Jhumur", "roll": 102, "grade": "B+"}
  ];


  studentInfo.add({
    "name": "Happy Family",
    "roll": 103,
    "grade": "A+"
  });

  print("\nStudent Info System:");
  for (var student in studentInfo) {
    print(
        "Name: ${student["name"]}, Roll: ${student["roll"]}, Grade: ${student["grade"]}"
    );
  }
  // -----------------------------
  // Step 11: Code cleanup and comments
  // -----------------------------
  List<String> name = [
    "Ferdaush",
    "Jhumur",
    "Happy Family",
    "Ferdaush"
  ];

  print("List: $name");

  Set<String> uniqueName = {
    "Ferdaush",
    "Jhumur",
    "Happy Family"
  };

  uniqueName.add("Ferdaush");

  print("Set: $uniqueName");

  Map<int, String> student7 = {
    101: "Ferdaush",
    102: "Jhumur"
  };

  print("Student with roll 101: ${student7[101]}");


  List<Map<String, dynamic>> studentInfo1 = [
    {
      "name": "Ferdaush",
      "roll": 101,
      "grade": "A"
    },
    {
      "name": "Jhumur",
      "roll": 102,
      "grade": "B+"
    }
  ];


  studentInfo1.add({
    "name": "Happy Family",
    "roll": 103,
    "grade": "A+"
  });

  print("\nStudent Info System:");

  for (var student in studentInfo1) {
    print(
        "Name: ${student["name"]}, "
            "Roll: ${student["roll"]}, "
            "Grade: ${student["grade"]}"
    );
  }
}



