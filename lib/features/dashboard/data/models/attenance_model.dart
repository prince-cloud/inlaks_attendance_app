class AttendanceModel {
  String uuid;
  int user;
  String clockIn;
  String? clockOut;
  int? hourseWorked;
  String dateCreated;
  String lastUpdated;

  AttendanceModel({
    required this.uuid,
    required this.user,
    required this.clockIn,
    required this.clockOut,
    required this.hourseWorked,
    required this.dateCreated,
    required this.lastUpdated,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      uuid: json['uuid'],
      user: json['user'],
      clockIn: json['clock_in'],
      clockOut: json['clock_out'],
      hourseWorked: json['hours_worked'],
      dateCreated: json['date_created'],
      lastUpdated: json['last_updated'],
    );
  }
}
