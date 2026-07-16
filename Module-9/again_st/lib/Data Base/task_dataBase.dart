import 'package:again_st/Model/task_model.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
class TaskDatabase {
  static Database? _db;
  
  static Future<Database>getDB() async {
    if(_db!=null) return _db!;

    _db = await openDatabase(
      p.join(await getDatabasesPath(), "Task.db"),
      version: 1,
      onCreate: (db , version) async{
        await db.execute("CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,isDone INTEGER)");
      },
      
    );
    return _db!;
  }

  static Future<void>insertTask(TaskModel task) async {
    final db = await getDB();
    await db.insert("tasks", task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace );
  }
  
  static Future<List<TaskModel>>getTask() async {
    final db = await getDB();
     final List<Map<String, dynamic>>maps = await db.query("tasks");
     return List.generate(maps.length, (index)=>TaskModel.fromMap(maps[index]));
  }
} 