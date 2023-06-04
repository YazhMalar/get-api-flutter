import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/remote_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? post;
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    post = (await RemoteServices().getPost())!;
    if (post != null) {
      setState(() {
        isLoaded = true;
      });
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
        child: ListView.builder(
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
                  )
                ],
              ),
            );
          },
          itemCount: post?.length,
        ),
        replacement: Center(
          child: CircularProgressIndicator(color: Colors.black),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => RemoteServices().postData(),
      //   child: Icon(Icons.ac_unit_rounded),
      // ),
    );
  }
}
