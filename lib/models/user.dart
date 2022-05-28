class User {
  int? id;
  bool? success;
  String? username;
  String? email;
  List<String>? roles;
  bool? isVolunteer;
  String? accessToken;
  String? name;
  String? surname;
  String? photoAddress;

  User(
      {this.id,
      this.success,
      this.username,
      this.email,
      this.roles,
      this.isVolunteer,
      this.name,
      this.surname,
      this.photoAddress,
      this.accessToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    success = json['success'];
    username = json['username'];
    email = json['email'];
    roles = json['roles'].cast<String>();
    isVolunteer = json['isVolunteer'];
    accessToken = json['accessToken'];
    photoAddress = json["photoAddress"];
    name = json["name"];
    surname = json["surname"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['success'] = this.success;
    data['username'] = this.username;
    data['email'] = this.email;
    data['roles'] = this.roles;
    data['isVolunteer'] = this.isVolunteer;
    data['accessToken'] = this.accessToken;
    data["photoAddress"] = this.photoAddress;
    data["surname"] = this.surname;
    data["name"] = this.name;
    return data;
  }
}
