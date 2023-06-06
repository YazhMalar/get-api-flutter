import 'dart:async';
import 'dart:convert';

import './postjson.dart';
import './serializers.dart';

import 'package:http/http.dart' as http;

const String url = 'https://jsonplaceholder.typicode.com/posts';

Future<List<Post>> getPostJson() async {
  final response = await http.get(Uri.parse(url));

  PostJson? postjson = serializers.deserializeWith(
      PostJson.serializer, json.decode(response.body));

  return postjson?.data.map((dynamic data) => data.data).toList();
}
