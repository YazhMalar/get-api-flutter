import 'package:flutter/material.dart';
import './models/reddit.dart';
import './models/api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<Post> _posts = [];
  ScrollController _scrollController = ScrollController();
  int _page = 0;
  bool _loadMore = false;
  bool _firstload = false;
  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_loadMore) return;
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _page++;
      setState(() {
        _loadMore = true;
      });

      getReddit(_page).then((posts) {
        setState(() {
          _posts = _posts + posts;
        });
      });
      setState(() {
        _loadMore = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    getReddit(_page).then((posts) {
      setState(() {
        _firstload = true;
        _posts = _posts + posts;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Visibility(
        visible: _firstload,
        child: ListView.builder(
          shrinkWrap: true,
          controller: _scrollController,
          itemCount: _loadMore ? _posts.length + 1 : _posts.length,
          itemBuilder: (BuildContext context, int index) {
            Post post = _posts[index];
            print(
                "loadmore: $_loadMore ---- index: $index ---- Post lenght: ${_posts.length}");
            if (index < _posts.length) {
              return ListTile(
                leading: CircleAvatar(
                  child: Image.network(
                    '${!post.thumbnail.contains(".jpg") ? "http://via.placeholder.com/300" : post.thumbnail}',
                    scale: 0.2,
                  ),
                ),
                title: Text('Title: ${post.title} by ${post.author}'),
                subtitle: Text(
                  'Subreddit: ${post.subreddit} with ${post.ups} upvotes',
                ),
              );
            } else {
              print('called');
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }
          },
        ),
        replacement: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
