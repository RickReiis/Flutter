class TodoModel {
  int? id;
  String? name;
  String? username;
  String? email;
  String? password;
  String? avatar;
  String? phone;
  String? website;
  String? company;

  TodoModel(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.password,
      this.avatar,
      this.phone,
      this.website,
      this.company});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    avatar = json['avatar'];
    phone = json['phone'];
    website = json['website'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['avatar'] = this.avatar;
    data['phone'] = this.phone;
    data['website'] = this.website;
    data['company'] = this.company;
    return data;
  }
}
