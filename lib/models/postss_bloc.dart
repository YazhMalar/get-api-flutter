import 'dart:async';

import 'dart:convert';

import './reddit.dart';
import './serializers.dart';

import 'package:http/http.dart' as http;

const String baseUrl = 'https://www.reddit.com/r/popular/new.json?count=25';

final int _limit = 10;
int _page = 0;

enum PostAction { Fetch, Delete }

class PostBloc {
  final stateStreamController = StreamController<List<Post>>();
  StreamSink<List<Post>> get postSink => stateStreamController.sink;
  Stream<List<Post>> get postStream => stateStreamController.stream;

  final eventStreamController = StreamController<PostAction>();
  StreamSink<PostAction> get eventSink => eventStreamController.sink;
  Stream<PostAction> get eventStream => eventStreamController.stream;

  PostBloc() {
    eventStream.listen((event) async {
      if (event == PostAction.Fetch) {
        var result = await getReddit(_page++);
        return postSink.add(result);
      }
    });
  }

  Future<List<Post>> getReddit(int _page) async {
    var uri = "$baseUrl&page=$_page&limit=$_limit";
    print(uri);
    final response = await http.get(Uri.parse(uri));
    Reddit? reddit = serializers.deserializeWith(
        Reddit.serializer, json.decode(response.body));

    return reddit!.data.children.map((Data data) => data.data).toList();
  }

  void dispose() {
    stateStreamController.close();
    eventStreamController.close();
  }
}
