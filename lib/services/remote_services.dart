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
}
