import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/remote_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? post = [];
  bool isLoaded = false;
  bool _isFirsLoaded = false;
  bool _hasNextPage = true;
  bool _isLoadMore = false;
  int _page = 0;
  final int _limit = 20;

  incPage() {
    _page += 1;
  }

  void firstload() {
    setState(() {
      _isFirsLoaded = true;
    });
    getData();
    setState(() {
      _isFirsLoaded = false;
    });
  }

  ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _loadMore() async {
    if (_hasNextPage == true &&
        _isFirsLoaded == false &&
        _isLoadMore == false &&
        _scrollController.position.extentAfter < 300) {
      setState(() {
        _isLoadMore = true;
      });

      incPage();

      try {
        var url = 'https://jsonplaceholder.typicode.com/comments';
        final res = await get(Uri.parse("$url?_page=$_page&_limit=$_limit"));

        final List fetchedPosts = json.decode(res.body);
        if (fetchedPosts.isNotEmpty) {
          setState(() {
            post!.addAll(fetchedPosts as Iterable<Post>);
          });
        } else {
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        print('Something went wrong!');
      }
      setState(() {
        _isLoadMore = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstload();
    // _scrollController = ScrollController()..addListener();
  }

  getData() async {
    post = (await RemoteServices().getPost())!.cast<Post>();
    if (post != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  postData() async {
    try {
      var response = await RemoteServices().postData();
      Map<String, dynamic> customResponse = jsonDecode(response);
      customResponse["postId"] = int.parse(customResponse["postId"]);
      var newPost = Post.fromJson(customResponse);
      setState(() {
        print(post![0]);
        post!.insert(0, newPost);
      });
    } catch (e) {
      print("error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        backgroundColor: Colors.amber,
      ),
      body: Visibility(
        visible: isLoaded,
        child: Column(
          children: [
            ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.only(top: 20),
              itemBuilder: (context, index) {
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
                            child: Text(post![index].id.toString()),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post![index].email,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                post![index].body,
                                style: TextStyle(
                                  fontSize: 6,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: post?.length,
            ),
          ],
        ),
        replacement: Center(
          child: CircularProgressIndicator(color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => postData(),
        child: Icon(Icons.ac_unit_sharp),
      ),
    );
  }
}
