import 'dart:io';

class NewsFeedModel {
  NewsFeedModel(
      {required this.name,
      required this.avatar,
      this.status,
      required this.time,
      this.imageAssets,
      this.imageFile});

  String? name;
  String avatar;
  String? status;
  String? time;
  String? imageAssets;
  File? imageFile;
}
