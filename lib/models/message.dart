import 'dart:io';

class Message {
  Message({this.isSender = true, this.message, this.imgFile});
  bool isSender;
  String? message;
  File? imgFile;
}
