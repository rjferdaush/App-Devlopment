class TaskStatusCount {
  String? sId;
  int? sum;

  TaskStatusCount({this.sId, this.sum});

  TaskStatusCount.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['sum'] = sum;
    return data;
  }
}

class TaskStatusCountListModel {
  String? status;
  List<TaskStatusCount>? data;

  TaskStatusCountListModel({this.status, this.data});

  TaskStatusCountListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <TaskStatusCount>[];
      json['data'].forEach((v) {
        data!.add(TaskStatusCount.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
