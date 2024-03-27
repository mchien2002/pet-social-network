import 'package:tutorialpage/models/person_model.dart';

class Comments {
  String? id;
  String? content;
  User? peopleComment;
  String? post;
  String? createdAt;
  String? updatedAt;

  Comments(
      {this.id,
      this.content,
      this.peopleComment,
      this.post,
      this.createdAt,
      this.updatedAt});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    content = json['content'];
    peopleComment = json['peopleComment'] != null
        ? User.fromJson(json['peopleComment'])
        : null;
    post = json['post'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['content'] = content;
    if (peopleComment != null) {
      data['peopleComment'] = peopleComment!.toJson();
    }
    data['post'] = post;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
