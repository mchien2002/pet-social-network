class PersonModel {
  final int id;
  final String avatar;
  final String name;
  String time;
  final bool isSender;

  PersonModel(
      {required this.id,
      required this.avatar,
      required this.name,
      required this.time,
      required this.isSender});
}

class UserCreateRequest {
  String? username;
  String? fullname;
  String? avatar;
  int? petType;
  String? address;
  String? birthdate;
  String? phone;
  String? password;

  UserCreateRequest({
    this.username,
    this.fullname,
    this.avatar,
    this.petType,
    this.address,
    this.birthdate,
    this.phone,
    this.password,
  });

  UserCreateRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    fullname = json['fullname'];
    avatar = json['avatar'];
    petType = json['petType'];
    address = json['address'];
    birthdate = json['birthdate'];
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['fullname'] = fullname;
    data['avatar'] = avatar;
    data['petType'] = petType;
    data['address'] = address;
    data['birthdate'] = birthdate;
    data['phone'] = phone;
    data['password'] = password;
    return data;
  }
}

class User {
  String? id;
  String? username;
  String? fullname;
  String? avatar;
  int? petType;
  int? followerCount;
  int? fanCount;
  int? postCount;
  String? address;
  String? birthdate;
  String? phone;
  String? password;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.username,
      this.fullname,
      this.avatar,
      this.petType,
      this.fanCount,
      this.followerCount,
      this.postCount,
      this.birthdate,
      this.phone,
      this.password,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    fullname = json['fullname'];
    avatar = json['avatar'];
    petType = json['petType'];
    postCount = json['postCount'];
    followerCount = json['followerCount'];
    fanCount = json['fanCount'];
    address = json['address'];
    birthdate = json['birthdate'];
    phone = json['phone'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['username'] = username;
    data['fullname'] = fullname;
    data['avatar'] = avatar;
    data['petType'] = petType;
    data['postCount'] = postCount;
    data['followerCount'] = followerCount;
    data['fanCount'] = fanCount;
    data['address'] = address;
    data['birthdate'] = birthdate;
    data['phone'] = phone;
    data['password'] = password;
    data['createdAt'] = createdAt!;
    data['updatedAt'] = updatedAt!;
    return data;
  }
}
