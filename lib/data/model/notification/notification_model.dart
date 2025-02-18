class NotificationModel {
  int? id;
  String? title;
  String? body;

  NotificationModel({
    this.id,
    this.title,
    this.body,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }
}
