class Appointment {
  final String mentorId;
  final String userId;
  final String mentorPlanId;
  final String meetingDatetime;
  final String meetingPuspose;
  final String duration;

  Appointment({
    required this.mentorId,
    required this.userId,
    required this.mentorPlanId,
    required this.meetingDatetime,
    required this.meetingPuspose,
    required this.duration,
  });

  factory Appointment.fromJSON(Map<String, dynamic> json) {
    return Appointment(
      mentorId: json["mentor"]["id"],
      userId: json["user"]["id"],
      mentorPlanId: json["mentor_plan"]["id"],
      meetingDatetime: json["meeting_datetime"],
      meetingPuspose: json["meeting_purpose"],
      duration: json["duration"],
    );
  }

  Map<String, dynamic> toJson() => {
        "user": {"id": userId},
        "mentor": {"id": mentorId},
        "mentor_plan": {"id": mentorPlanId},
        "meeting_datetime": meetingDatetime,
        "meeting_purpose": meetingPuspose,
        "duration": duration
      };
}
