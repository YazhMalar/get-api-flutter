import 'package:flutter/material.dart';
import '../models/reddit.dart';
import '../models/api.dart';

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<Post> _posts = [];

  @override
  void initState() {
    super.initState();
    getReddit().then((posts) {
      setState(() {
        _posts = posts;
      });
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
        title: Text('Posts'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: buildListTiles(),
      ),
    );
  }
}
