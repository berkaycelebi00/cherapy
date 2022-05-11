class User {
  int? id;
  bool? success;
  String? username;
  String? email;
  List<String>? roles;
  bool? isVolunteer;
  String? accessToken;

  User(
      {this.id,
      this.success,
      this.username,
      this.email,
      this.roles,
      this.isVolunteer,
      this.accessToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    success = json['success'];
    username = json['username'];
    email = json['email'];
    roles = json['roles'].cast<String>();
    isVolunteer = json['isVolunteer'];
    accessToken = json['accessToken'];
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
    return data;
  }
}
