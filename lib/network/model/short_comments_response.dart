class ShortCommentsResponse {
  List<Comment> comments;

  ShortCommentsResponse(this.comments);

  factory ShortCommentsResponse.fromJson(Map<String, dynamic> json) {
    var commentsList = json["comments"] as List;
    return ShortCommentsResponse(
        commentsList.map((i) => Comment.fromJson(i)).toList());
  }
}

class Comment {
  String author;

  String content;

  String avatar;

  int time;

  int id;

  int likes;

  Comment(
      {this.author, this.content, this.avatar, this.time, this.id, this.likes});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        author: json["author"],
        content: json["content"],
        avatar: json["avatar"],
        time: json["time"],
        id: json["id"],
        likes: json["likes"]);
  }
}
