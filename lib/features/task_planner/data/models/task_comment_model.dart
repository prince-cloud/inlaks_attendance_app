

class TaskCommentModel {
  final int id, user,task;
  final String comment;
  final String dateCreated;
  final String lastUpdated;
  TaskCommentModel({
    required this.id,
    required this.user,
    required this.task,
    required this.comment,
    required this.dateCreated,
    required this.lastUpdated,
  });

  static TaskCommentModel fromJson(Map<String, dynamic> json) {
    return TaskCommentModel(
      id: json['id'],
      user: json['user'],
      task: json['task'],
      comment: json['comment'],
      dateCreated: json['date_created'],
      lastUpdated: json['last_updated'],
    );
  }
}