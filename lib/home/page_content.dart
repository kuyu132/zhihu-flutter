import 'package:flutter/material.dart';
import 'package:flutter_zhihu/common/search_page.dart';

class PageContent extends StatefulWidget {
  String title;
  String imageUrl;
  String digest;

  PageContent({this.title, this.imageUrl, this.digest});

  @override
  State<StatefulWidget> createState() {
    return new _PageContentState();
  }
}

class _PageContentState extends State<PageContent> {
  Widget searchBar() {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new FlatButton.icon(
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                  return new SearchPage();
                }));
              },
              icon: Icon(Icons.search),
              label: Text("搜索知乎内容")),
        ),
        new Padding(
          padding: EdgeInsets.only(left: 32.0),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: searchBar(),
      ),
      body: new Container(),
    );
  }
}
