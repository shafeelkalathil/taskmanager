
class FetchTaskModel {
  DateTime? date;
  List<TaskModel>? tasks;

  FetchTaskModel({
    this.date,
    this.tasks,
  });

  FetchTaskModel copyWith({
    DateTime? date,
    List<TaskModel>? tasks,
  }) =>
      FetchTaskModel(
        date: date ?? this.date,
        tasks: tasks ?? this.tasks,
      );

  factory FetchTaskModel.fromJson(Map<String, dynamic> json) => FetchTaskModel(
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    tasks: json["tasks"] == null ? [] : List<TaskModel>.from(json["tasks"]!.map((x) => TaskModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "tasks": tasks == null ? [] : List<dynamic>.from(tasks!.map((x) => x.toJson())),
  };
}

class TaskModel {
  String? description;
  int? taskId;
  String? time;
  String? title;
  List<TaskModel>? subtasks;

  TaskModel({
    this.description,
    this.taskId,
    this.time,
    this.title,
    this.subtasks,
  });

  TaskModel copyWith({
    String? description,
    int? taskId,
    String? time,
    String? title,
    List<TaskModel>? subtasks,
  }) =>
      TaskModel(
        description: description ?? this.description,
        taskId: taskId ?? this.taskId,
        time: time ?? this.time,
        title: title ?? this.title,
        subtasks: subtasks ?? this.subtasks,
      );

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    description: json["description"],
    taskId: json["taskId"],
    time: json["time"],
    title: json["title"],
    subtasks: json["subtasks"] == null ? [] : List<TaskModel>.from(json["subtasks"]!.map((x) => TaskModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "taskId": taskId,
    "time": time,
    "title": title,
    "subtasks": subtasks == null ? [] : List<dynamic>.from(subtasks!.map((x) => x.toJson())),
  };
}
