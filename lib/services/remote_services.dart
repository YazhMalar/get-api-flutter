import '../models/post.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  Future<List<Post>?> getPost() async {
    var Client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    var response = await Client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
    return null;
  }

  Future<List<Post>?> postData() async {
    try {
      var uri = Uri.parse('https://jsonplaceholder.typicode.com/comments');
      var response = await http.post(uri, body: {
        "postId": 1,
        "name": "yazhini",
        "email": "yazh@gamil.com",
        "body": "heloo all"
      });
      print(response.body);
    } catch (e) {
      print("error: $e");
    }
  }
}
