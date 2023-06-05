import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLoaded = false;
  List _postList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts();
  }

  var i = 0;
  var url = "https://jsonplaceholder.typicode.com/posts";
  void fetchPosts() async {
    try {
      var response = await get(Uri.parse(url));
      var jsonData = jsonDecode(response.body);
      setState(() {
        _postList = jsonData;
        isLoaded = true;
      });
    } catch (e) {}
  }

  void postData() async {
    try {
      var response = await post(Uri.parse(url), body: {
        "userid": i.toString(),
        "title": "Yazhini",
        "body": "dodge challenger",
      });
      print(response.statusCode);
      print(response.body);
      Map<String, dynamic> customResponse = jsonDecode(response.body);
      // customResponse["userid"] = i;

      setState(() {
        _postList.insert(0, customResponse);
        i++;
        fetchPosts();
      });
    } catch (e) {
      print("error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          padding: EdgeInsets.only(top: 20),
          itemBuilder: (context, index) {
            var post = _postList[index];
            return Container(
              padding:
                  EdgeInsets.only(left: 20).add(EdgeInsets.only(bottom: 5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text("${post["id"].toString()}"),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post["title"],
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            post["body"],
                            style: TextStyle(
                              fontSize: 6,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: _postList.length,
        ),
        replacement: Center(
          child: CircularProgressIndicator(color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: postData,
        child: Icon(Icons.ac_unit_rounded),
      ),
    );
  }
}
