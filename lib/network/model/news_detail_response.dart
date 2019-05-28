class NewsDetailResponse {
  String share_url;

  String title;

  String image;

  int id;

  int type;

  NewsDetailResponse(
      {this.share_url, this.title, this.image, this.id, this.type});

  factory NewsDetailResponse.fromJson(Map<String, dynamic> json) {
    return NewsDetailResponse(
        share_url: json["share_url"],
        title: json["title"],
        image: json["image"],
        id: json["id"],
        type: json["type"]);
  }
}
