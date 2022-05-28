class Calendar {
  bool? success;
  List<Calendars>? calendars;

  Calendar({this.success, this.calendars});

  Calendar.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['calendars'] != null) {
      calendars = <Calendars>[];
      json['calendars'].forEach((v) {
        calendars!.add(new Calendars.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.calendars != null) {
      data['calendars'] = this.calendars!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Calendars {
  int? id;
  int? professionalId;
  String? title;
  String? description;
  String? date;
  String? createdAt;
  String? updatedAt;

  Calendars(
      {this.id,
      this.professionalId,
      this.title,
      this.description,
      this.date,
      this.createdAt,
      this.updatedAt});

  Calendars.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    professionalId = json['professionalId'];
    title = json['title'];
    description = json['description'];
    date = json['date'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['professionalId'] = this.professionalId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['date'] = this.date;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
