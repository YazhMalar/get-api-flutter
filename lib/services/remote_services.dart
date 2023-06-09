import '../models/post.dart';
import 'package:http/http.dart' as http;

var i = 0;

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

  postData() async {
    try {
      var url = 'https://jsonplaceholder.typicode.com/comments';
      dynamic response = await http.post(Uri.parse(url), body: {
        "postId": (i++).toString(),
        "email": "Yazhini@gmail.com",
        "body": "dodge challenger",
        "name": "Yazhini",
      });
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 201) {
        print(response.body.runtimeType);
        return response.body;
      }
    } catch (e) {
      print("error $e");
    }
  }
}
