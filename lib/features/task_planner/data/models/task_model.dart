
class TaskModel {
  int id,user;
  String? notifyMe;
  String description,priority, dateCreated, lastUpdated,dueDate,status;


  TaskModel({
    required this.id,
    required this.user,
    required this.description,
    required this.dateCreated,
    required this.dueDate,
    required this.lastUpdated,
    this.notifyMe,
    required this.priority,
    required this.status
  });

  static TaskModel fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      user: json['user'],
      description: json['description'],
      dateCreated: json['date_created'],
      dueDate: json['due_date'],
      lastUpdated: json['last_updated'],
      notifyMe: json['notify_me'],
      priority: json['priority'],
      status: json['status'],
    );

}

}