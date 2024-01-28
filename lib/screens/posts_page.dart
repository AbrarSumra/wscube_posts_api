import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:wscube_posts/models/post_model.dart';
import 'package:wscube_posts/widget_constant/row_text.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  DataModel? postData;

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Posts",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: postData != null && postData!.posts.isNotEmpty
          ? ListView.builder(
              itemCount: postData!.posts.length,
              itemBuilder: (ctx, index) {
                var post = postData!.posts[index];
                return Card(
                  color: Colors.blue.shade200,
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            RowText(
                              title: "Tag: ",
                              desc: "${post.tags}",
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "UserId: ",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${post.userId}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              CupertinoIcons.heart_fill,
                              color: Colors.red,
                            ),
                            Text(
                              " ${post.reactions}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        RowText(
                          title: "Title: ",
                          desc: post.title,
                        ),
                        RowText(
                          title: "Desc: ",
                          desc: post.body,
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  void getPosts() async {
    var uri = Uri.parse("https://dummyjson.com/posts");
    var response = await https.get(uri);

    if (response.statusCode == 200) {
      var mData = jsonDecode(response.body);
      postData = DataModel.fromJson(mData);
      setState(() {});
    }
  }
}
