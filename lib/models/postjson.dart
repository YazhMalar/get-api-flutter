import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'postjson.g.dart';

abstract class PostJson implements Built<PostJson, PostJsonBuilder> {
  Post get data;

  PostJson._();
  factory PostJson([updates(PostJsonBuilder b)]) = _$PostJson;

  static Serializer<PostJson> get serializer => _$postJsonSerializer;
}

abstract class Post implements Built<Post, PostBuilder> {
  String get userid;

  String get title;
  String get body;

  int get id;

  Post._();
  factory Post([updates(PostBuilder b)]) = _$Post;
  static Serializer<Post> get serializer => _$postSerializer;

  map(Function(dynamic data) param0) {}

  static fromJson(Map<String, dynamic> customResponse) {}
}
