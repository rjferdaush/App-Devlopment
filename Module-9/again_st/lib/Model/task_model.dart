
class TaskModel {
  final int ? id;
  final String titel;
  final bool isDone;

  TaskModel({this.id, required this.titel, required this.isDone});
  Map<String, dynamic>toMap(){
    return{
      "id" : id,
      "titel" : titel,
      "isDone" : isDone ? 1 : 0,
    };
  }
  factory TaskModel.fromMap(Map<String, dynamic>map){
    return TaskModel(id: map["id"], titel: map["titel"], isDone: map["isDone"]==1); 
    }

  // static Future<List<TaskModel>> getTask() async {}

}