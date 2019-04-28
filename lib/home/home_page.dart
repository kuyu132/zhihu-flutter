import 'package:flutter/material.dart';
import 'follow.dart';
import 'recommend.dart';
import 'hot.dart';
import 'package:flutter_zhihu/global_config.dart';
import 'package:flutter_zhihu/common/search_page.dart';
import 'package:flutter_zhihu/common/ask_question.dart';
import 'package:flutter_zhihu/network/network.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomeState();
}

class _HomeState extends State<HomePage> {
  Widget tabBar() {
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.note),
            onPressed: () {},
          ),
          FlatButton.icon(
              onPressed: () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new SearchPage();
                }));
              },
              icon: Icon(Icons.search),
              label: Text("《复联4》完全观影指南")),
          new Container(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new AskQuestionPage();
                }));
              },
              child: new Row(
                children: <Widget>[
                  Icon(Icons.palette),
                  Text("提问",style: TextStyle(fontSize: 12.0),),
                ],
              ),
            ),
          ),
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
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  new Tab(text: "关注"),
                  new Tab(text: "推荐"),
                  new Tab(text: "热榜")
                ]),
          ),
          body: new TabBarView(
              children: [new Follow(), new Follow(), new Follow()]),
        ));
  }
}
