class EventModel {
  String? id;
  String? creator;
  String? eventStart;
  String? eventEnd;
  String? updatedAt;
  String? description;
  String? createdAt;
  String? title;

  EventModel(
      {this.id,
      this.creator,
      this.eventStart,
      this.eventEnd,
      this.updatedAt,
      this.description,
      this.createdAt,
      this.title});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creator = json['creator'];
    eventStart = json['event_start'];
    eventEnd = json['event_end'];
    updatedAt = json['updated_at'];
    description = json['description'];
    createdAt = json['created_at'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['creator'] = this.creator;
    data['event_start'] = this.eventStart;
    data['event_end'] = this.eventEnd;
    data['updated_at'] = this.updatedAt;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['title'] = this.title;
    return data;
  }
}
