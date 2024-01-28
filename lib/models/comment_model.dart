class CommentModel {
  int id;
  String body;
  int postId;
  Users user;

  CommentModel({
    required this.id,
    required this.body,
    required this.postId,
    required this.user,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json["id"],
      body: json["body"],
      postId: json["postId"],
      user: Users.fromJson(json["user"]),
    );
  }
}

class Users {
  int id;
  String username;

  Users({
    required this.id,
    required this.username,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json["id"],
      username: json["username"],
    );
  }
}

class CommentDataModel {
  int total;
  int skip;
  int limit;
  List<CommentModel> comments;

  CommentDataModel({
    required this.total,
    required this.skip,
    required this.limit,
    required this.comments,
  });

  factory CommentDataModel.fromJson(Map<String, dynamic> json) {
    List<CommentModel> allPosts = [];

    for (Map<String, dynamic> eachMap in json["comments"]) {
      allPosts.add(CommentModel.fromJson(eachMap));
    }

    return CommentDataModel(
      total: json["total"],
      skip: json["skip"],
      limit: json["limit"],
      comments: allPosts,
    );
  }
}
