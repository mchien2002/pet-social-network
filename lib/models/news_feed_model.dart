import 'package:pet_social_network/models/comment_model.dart';
import 'package:pet_social_network/models/person_model.dart';

class NewFeed {
  String? id;
  String? title;
  User? owner;
  List<String>? attachFiles;
  String? createdAt;
  String? updatedAt;
  int? likeCount;
  int? shareCount;
  List<Comments>? comments;

  NewFeed(
      {this.id,
      this.title,
      this.owner,
      this.attachFiles,
      this.createdAt,
      this.updatedAt,
      this.likeCount,
      this.shareCount,
      this.comments});

  NewFeed.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    owner = json['owner'] != null ? User.fromJson(json['owner']) : null;
    attachFiles = json['attachFiles'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    likeCount = json['likeCount'];
    shareCount = json['shareCount'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['attachFiles'] = attachFiles;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['likeCount'] = likeCount;
    data['shareCount'] = shareCount;
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
