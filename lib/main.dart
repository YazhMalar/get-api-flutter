import 'package:flutter/material.dart';
import '../views/home_page.dart';

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

// class MyHomePage extends StatefulWidget {
//   @override
//   MyHomePageState createState() => MyHomePageState();
// }

// class MyHomePageState extends State<MyHomePage> {
//   List<Post> _posts = [];

//   @override
//   void initState() {
//     super.initState();
//     getReddit().then((posts) {
//       setState(() {
//         _posts = posts;
//       });
//     });
//   }

//   List<Widget> buildListTiles() {
//     return _posts
//         .map((post) => ListTile(
//               leading: CircleAvatar(
//                   child: Image.network(
//                 '${!post.thumbnail.contains(".jpg") ? "http://via.placeholder.com/300" : post.thumbnail}',
//                 scale: 0.2,
//               )),
//               title: Text('Title: ${post.title} by ${post.author}'),
//               subtitle: Text(
//                 'Subreddit: ${post.subreddit} with ${post.ups} upvotes',
//               ),
//             ))
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Posts'),
//       ),
//       body: ListView(
//         shrinkWrap: true,
//         children: buildListTiles(),
//       ),
//     );
//   }
// }
