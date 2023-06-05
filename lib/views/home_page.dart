import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var i = 0;
  var url = "https://jsonplaceholder.typicode.com/posts";
  void postData() async {
    try {
      var response = await post(Uri.parse(url), body: {
        "userid": i.toString(),
        "title": "Yazhini",
        "body": "dodge challenger",
      });
      print(response.statusCode);
      print(response.body);
      setState(() {
        i++;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: FloatingActionButton(
          onPressed: postData,
          child: Icon(Icons.ac_unit_rounded),
        ),
      ),
    );
  }
}
