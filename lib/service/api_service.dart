import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pet_social_network/models/comment_model.dart';
import 'package:pet_social_network/models/news_feed_model.dart';
import 'package:pet_social_network/models/person_model.dart';

class ApiService {
  final String baseUrl = "http://52.74.135.27:8081/api/v1";
  Future<User> loginAPI(String username, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/user/signin'),
        body: {"username": username, "password": password});
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return User.fromJson(responseData["data"]);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<User> signupAPI(UserCreateRequest newUser) async {
    final response = await http.post(Uri.parse('$baseUrl/user/signup'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(newUser.toJson()));
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return User.fromJson(responseData["data"]);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<NewFeed>> getOwnPost(String ownerId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/newfeeds')
          .replace(queryParameters: {"owner_id": ownerId}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body)["data"];
      final result =
          responseData.map<NewFeed>((json) => NewFeed.fromJson(json)).toList();
      return result;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<NewFeedResponse> postNewFeed(
      String title, String ownerId, List<File> listImgFile) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/post'));
    request.fields['title'] = title;
    request.fields['owner'] = ownerId;

    for (var file in listImgFile) {
      request.files.add(await http.MultipartFile.fromPath('img', file.path));
    }
    var streamedResponse = await request.send();
    if (streamedResponse.statusCode == 201) {
      var response = await http.Response.fromStream(streamedResponse);
      final responseData = json.decode(response.body);
      return NewFeedResponse.fromJson(responseData["data"]);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<NewFeed> likePost(String ownerId, String postId) async {
    final response = await http.post(Uri.parse('$baseUrl/post/like'),
        body: {"userId": ownerId, "postId": postId});
    if (response.statusCode == 201) {
      final responseData = json.decode(response.body);
      return NewFeed.fromJson(responseData["data"]);
    } else {
      throw Exception('Failed to load data');
    }
  }

<<<<<<< HEAD
  Future<void> followUser(String userId, String peopleFollowId) async {
    final response = await http.post(Uri.parse('$baseUrl/follow'),
        body: {"userId": userId, "followerId": peopleFollowId});
    if (response.statusCode == 201) {
=======
  Future<Comments> commentPost(String ownerId, String postId, String content) async {
    final response = await http.post(Uri.parse('$baseUrl/comment'),
        body: {"peopleComment": ownerId, "post": postId,"content" : content});
    if (response.statusCode == 201) {
      final responseData = json.decode(response.body);
      print(responseData);
      return Comments.fromJson(responseData["data"]);
>>>>>>> 0d8d3c9 (dang update)
    } else {
      throw Exception('Failed to load data');
    }
  }
}
