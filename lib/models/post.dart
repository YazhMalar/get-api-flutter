// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'post.g.dart';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class Post {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Post({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  // factory Post.fromJson(Map<String, dynamic> json) => Post(
  //       id: json["id"],
  //       postId: json["postId"],
  //       name: json["name"],
  //       email: json["email"],
  //       body: json["body"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "postId": postId,
  //       "id": id,
  //       "name": name,
  //       "email": email,
  //       "body": body,
  //     };
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
