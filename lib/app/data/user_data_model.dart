class UserData {
  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;

  UserData({this.id, this.name, this.email, this.gender, this.status});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['gender'] = gender;
    data['status'] = status;
    return data;
  }
}
