import 'dart:async';
import 'dart:convert';

import './reddit.dart';
import './serializers.dart';

import 'package:http/http.dart' as http;

const String baseUrl = 'https://www.reddit.com/r/popular/new.json?count=25';

final int _limit = 10;
Future<List<Post>> getReddit(int _page) async {
  var uri = "$baseUrl&page=$_page&limit=$_limit";
  print(uri);
  final response = await http.get(Uri.parse(uri));
  print(uri);
  Reddit? reddit = serializers.deserializeWith(
      Reddit.serializer, json.decode(response.body));

  return reddit!.data.children.map((Data data) => data.data).toList();
}
