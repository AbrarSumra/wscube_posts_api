import 'package:flutter/material.dart';
import 'package:wscube_posts/screens/comment_page.dart';
import 'package:wscube_posts/screens/posts_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  List<dynamic> screens = [
    const PostsPage(),
    const CommentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: "Posts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_outlined),
            label: "Comments",
          ),
        ],
      ),
    );
  }
}
