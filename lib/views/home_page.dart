import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/reddit.dart';
import '../models/api.dart';
import '../views/login_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<Post> _posts = [];
  String? input = "";

  @override
  void initState() {
    super.initState();
    getPrevPageText();

    getReddit().then((posts) {
      setState(() {
        _posts = posts;
      });
    });
  }

  void getPrevPageText() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      input = preferences.getString("username");
      // print(input);
    });
  }

  List<Widget> buildListTiles() {
    return _posts
        .map((post) => ListTile(
              leading: CircleAvatar(
                  child: Image.network(
                '${!post.thumbnail.contains(".jpg") ? "http://via.placeholder.com/300" : post.thumbnail}',
                scale: 0.2,
              )),
              title: Text('Title: ${post.title} by ${post.author}'),
              subtitle: Text(
                'Subreddit: ${post.subreddit} with ${post.ups} upvotes',
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            child: const Icon(Icons.logout),
            onTap: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              await preferences.clear();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false);
            },
          ),
        ],
        title: const Text('Posts'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        shrinkWrap: true,
        children: buildListTiles(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("$input"),
      ),
    );
  }
}
