class Ad {
  bool? success;
  List<Ads>? ads;

  Ad({this.success, this.ads});

  Ad.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['ads'] != null) {
      ads = <Ads>[];
      json['ads'].forEach((v) {
        ads!.add(new Ads.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.ads != null) {
      data['ads'] = this.ads!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ads {
  int? id;
  String? imageUrl;
  String? description;
  int? professionalId;
  String? createdAt;
  String? updatedAt;
  AdUser? user;

  Ads(
      {this.id,
      this.imageUrl,
      this.description,
      this.professionalId,
      this.createdAt,
      this.updatedAt,
      this.user});

  Ads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    professionalId = json['professionalId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? new AdUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageUrl'] = this.imageUrl;
    data['description'] = this.description;
    data['professionalId'] = this.professionalId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class AdUser {
  String? name;
  String? surname;
  int? id;

  AdUser({this.name, this.surname, this.id});

  AdUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['id'] = this.id;
    return data;
  }
}
