import 'package:flutter/material.dart';
import 'package:flutter_zhihu/global_config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_zhihu/network/model/search_recommend.dart';

class SearchTab extends StatefulWidget {
  SearchType type = SearchType.HOT;

  SearchTab(this.type);

  @override
  State<StatefulWidget> createState() {
    return new _SearchTabState(type);
  }
}

class _SearchTabState extends State<SearchTab> {
  SearchType type = SearchType.HOT;

  _SearchTabState(this.type);

  List<SearchRecommend> getRecommend() {
    List<SearchRecommend> items = <SearchRecommend>[];
    items.add(SearchRecommend("我是创作人", "啊啊沙发垫发"));
    items.add(SearchRecommend("我是创作人", "啊啊沙发垫发"));
    items.add(SearchRecommend("我是创作人", "啊啊沙发垫发"));
    items.add(SearchRecommend("我是创作人", "啊啊沙发垫发"));
    items.add(SearchRecommend("我是创作人", "啊啊沙发垫发"));
    items.add(SearchRecommend("我是创作人", "啊啊沙发垫发"));
    items.add(SearchRecommend("我是创作人", "啊啊沙发垫发"));
    items.add(SearchRecommend("我是创作人", "啊啊沙发垫发"));
    return items;
  }

  @override
  Widget build(BuildContext context) {
    List<SearchRecommend> items = getRecommend();
    return new Container(
      child: new Column(
        children: <Widget>[
          new GridView.count(
            crossAxisCount: 2,
            children: new List.generate(items.length, (index) {
              return new Container(
                child: new Row(
                  children: <Widget>[
                    new Text("$index"),
                    new Column(
                      children: <Widget>[
                        new Text(
                          items[index].title,
                        ),
                        new Text(items[index].subTitle)
                      ],
                    )
                  ],
                ),
              );
            }),
          ),
          new Column(
            children: <Widget>[new Text("test")],
          )
        ],
      ),
    );
  }
}

//class ListGridView extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new ListView.separated(itemBuilder: null, separatorBuilder: null, itemCount: null)
//  }
//
//}
