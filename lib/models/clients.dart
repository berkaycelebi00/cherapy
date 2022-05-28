class ClientModel {
  bool? success;
  List<Clients>? clients;

  ClientModel({this.success, this.clients});

  ClientModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['clients'] != null) {
      clients = <Clients>[];
      json['clients'].forEach((v) {
        clients!.add(new Clients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.clients != null) {
      data['clients'] = this.clients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Clients {
  int? id;
  int? professionalId;
  int? clientId;
  String? note;
  String? createdAt;
  String? updatedAt;
  ProfessionalUser? professionalUser;
  ProfessionalUser? clientuser;

  Clients(
      {this.id,
      this.professionalId,
      this.clientId,
      this.note,
      this.createdAt,
      this.updatedAt,
      this.professionalUser,
      this.clientuser});

  Clients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    professionalId = json['professionalId'];
    clientId = json['clientId'];
    note = json['note'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    professionalUser = json['professionalUser'] != null
        ? new ProfessionalUser.fromJson(json['professionalUser'])
        : null;
    clientuser = json['clientuser'] != null
        ? new ProfessionalUser.fromJson(json['clientuser'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['professionalId'] = this.professionalId;
    data['clientId'] = this.clientId;
    data['note'] = this.note;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.professionalUser != null) {
      data['professionalUser'] = this.professionalUser!.toJson();
    }
    if (this.clientuser != null) {
      data['clientuser'] = this.clientuser!.toJson();
    }
    return data;
  }
}

class ProfessionalUser {
  String? name;
  String? surname;
  String? gender;
  int? id;

  ProfessionalUser({this.name, this.surname, this.id});

  ProfessionalUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['id'] = this.id;
    data["gender"] = this.gender;
    return data;
  }
}
