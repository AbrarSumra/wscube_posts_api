class PostsModel {
  int id;
  String title;
  String body;
  int userId;
  List<dynamic> tags;
  num reactions;

  PostsModel({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    required this.tags,
    required this.reactions,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      id: json["id"],
      title: json["title"],
      body: json["body"],
      userId: json["userId"],
      tags: json["tags"],
      reactions: json["reactions"],
    );
  }
}

class DataModel {
  int total;
  int skip;
  int limit;
  List<PostsModel> posts;

  DataModel({
    required this.total,
    required this.skip,
    required this.limit,
    required this.posts,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    List<PostsModel> allPosts = [];

    for (Map<String, dynamic> eachMap in json["posts"]) {
      allPosts.add(PostsModel.fromJson(eachMap));
    }

    return DataModel(
      total: json["total"],
      skip: json["skip"],
      limit: json["limit"],
      posts: allPosts,
    );
  }
}
