import 'package:flutter/material.dart';
import 'follow.dart';
import 'recommend.dart';
import 'hot.dart';
import 'package:flutter_zhihu/global_config.dart';
import 'package:flutter_zhihu/search_page.dart';
import 'ask_question.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomeState();
}

class _HomeState extends State<HomePage> {
  Widget tabBar() {
    return new Container(
      child: new Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.note),
            onPressed: () {},
          ),
          Expanded(
              child: FlatButton.icon(
                  onPressed: () {
                    Navigator.of(context)
                        .push(new MaterialPageRoute(builder: (context) {
                      return new SearchPage();
                    }));
                  },
                  icon: Icon(Icons.search),
                  label: Text("《复联4》完全观影指南"))),
          FlatButton.icon(
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                  return new AskQuestionPage();
                }));
              }, icon: Icon(Icons.palette), label: Text("提问")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            title: tabBar(),
            bottom: new TabBar(
                labelColor: GlobalConfig.dark == true
                    ? new Color(0xFF63FDD9)
                    : Colors.blue,
                unselectedLabelColor:
                    GlobalConfig.dark == true ? Colors.white : Colors.black,
                tabs: [
                  new Tab(text: "关注"),
                  new Tab(text: "推荐"),
                  new Tab(text: "热榜")
                ]),
          ),
          body: new TabBarView(
              children: [new Follow(), new Recommend(), new Hot()]),
        ));
  }
}
