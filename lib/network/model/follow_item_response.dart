class Stories {
  String ga_prefix;

  int id;

  List<String> images;

  String title;

  int type;

  int agreeNum = 0;

  int commentNum = 0;

  Stories({this.ga_prefix, this.id, this.images, this.title, this.type});

  factory Stories.fromJson(Map<String, dynamic> json) {
    var imagesFromJson = json['images'];
    return Stories(
        ga_prefix: json['ga_prefix'],
        id: json['id'],
        images: new List.from(imagesFromJson),
        title: json['title'],
        type: json['type']);
  }
}

class Top_stories {
  String ga_prefix;

  int id;

  String image;

  String title;

  int type;

  Top_stories({this.ga_prefix, this.id, this.image, this.title, this.type});

  factory Top_stories.fromJson(Map<String, dynamic> json) {
    return Top_stories(
        ga_prefix: json['ga_prefix'],
        id: json['id'],
        image: json['image'],
        title: json['title'],
        type: json['type']);
  }
}

class FollowItemResponse {
  String date;

  String statusText;

  List<Stories> stories;

  int success;

  String timestamp;

  List<Top_stories> top_stories;

  FollowItemResponse(
      {this.date,
      this.statusText,
      this.stories,
      this.success,
      this.timestamp,
      this.top_stories});

  factory FollowItemResponse.fromJson(Map<String, dynamic> json) {
    var topStoriesList = json['top_stories'] as List;
    var storiesList = json['stories'] as List;
    return FollowItemResponse(
        date: json['date'],
        statusText: json['statusText'],
        stories: storiesList.map((i) => Stories.fromJson(i)).toList(),
        success: json['success'],
        timestamp: json['timestamp'],
        top_stories:
            topStoriesList.map((i) => Top_stories.fromJson(i)).toList());
  }

}
