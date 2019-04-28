import 'package:flutter/material.dart';
import 'home/follow.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: <Widget>[
                new Expanded(
                  child: FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                      label: Text("搜索知乎内容",textAlign: TextAlign.start,)),
                ),
                new Padding(padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0)),
                Text("取消",style: TextStyle(fontSize: 16.0),),
              ],
            ),
            bottom: new TabBar(tabs: [
              new Tab(
                text: "热搜",
              ),
              new Tab(
                text: "数码",
              ),
              new Tab(
                text: "影视",
              ),
              new Tab(text: "体育"),
              new Tab(
                text: "新知",
              ),
              new Tab(
                text: "综艺",
              )
            ]),
          ),
          body: new TabBarView(children: [new Follow()]),
        ));
  }
}
