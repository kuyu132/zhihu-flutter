import 'package:flutter/material.dart';
import 'package:flutter_zhihu/network/network.dart';
import 'package:flutter_zhihu/network/model/short_comments_response.dart';

class CommentPage extends StatefulWidget {
  int id;

  CommentPage(this.id);

  @override
  State<StatefulWidget> createState() {
    return _CommentPageState(this.id);
  }
}

class _CommentPageState extends State<CommentPage> {
  int id;
  List<Comment> comments = new List();

  _CommentPageState(this.id);

  @override
  void initState() {
    super.initState();
    HttpManager().getShortComments(id).then((response) {
      comments.addAll(response.comments);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("全部评论"),
      ),
      body: new Container(
        height: 800.0,
        child: ListView.separated(
            itemBuilder: _listItemBuilder,
            separatorBuilder: (context, index) => new Container(
                  height: 4.0,
                  color: Colors.white10,
                ),
            itemCount: comments.isEmpty ? 0 : comments.length),
      ),
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    Comment comment = comments[index];
    return new Container(
      child: new Row(
        children: <Widget>[
          new Container(
            width: 32.0,
            height: 32.0,
            decoration: BoxDecoration(
                image: DecorationImage(image: new NetworkImage(comment.avatar)),
                shape: BoxShape.circle),
          ),
          new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(comment.author),
                  Icon(Icons.more),
                ],
              ),
              new Text(comment.content),
              new Row(
                children: <Widget>[
                  new Text("3/21"),
                  new Row(
                    children: <Widget>[
                      new Icon(Icons.favorite),
                      new Icon(Icons.comment),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
