import '../models/post.dart';
import 'package:http/http.dart' as http;

import '../views/home_page.dart';

class RemoteServices {
  Future<List<Post>?> getPost() async {
    var Client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    var response = await Client.get(uri);
    print("Status: ${response.statusCode}");
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
    return null;
  }

  Future<void> postData() async {
    try {
      var uri = Uri.parse('https://jsonplaceholder.typicode.com/comments');
      var response = await http.post(uri, body: {
        "postId": 1.toString(),
        "name": "Yazhini",
        "email": "yazh@gamil.ds",
        "body": "dodge challenger",
      });
      print("Status: ${response.statusCode}");
      // if (response.statusCode == 201) {
      //   i++;
      // }
      print(response.body);
    } catch (e) {
      print("error");
    }
  }
}
