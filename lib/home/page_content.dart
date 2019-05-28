import 'package:flutter/material.dart';
import 'package:flutter_zhihu/common/search_page.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_zhihu/network/network.dart';
import 'comment_page.dart';

class PageContent extends StatefulWidget {
  String title;
  int id;

  PageContent({this.id, this.title});

  @override
  State<StatefulWidget> createState() {
    return new _PageContentState(id: id, title: title);
  }
}

class _PageContentState extends State<PageContent> {
  String title;
  int id;
  String _url;

  _PageContentState({this.id, this.title});

  @override
  void initState() {
    super.initState();

    HttpManager().getNewsDetail(id).then((response) {
      setState(() {
        _url = response.share_url;
        print("_url:$_url");
      });
    });
  }

  Widget searchBar() {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new FlatButton.icon(
              onPressed: () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
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
        body: _url == null
            ? new Container(
                child: Text("正在加载中..."),
                alignment: Alignment.center,
              )
            : new WebviewScaffold(
                url: _url,
                withZoom: false,
                withLocalStorage: true,
              ),
        bottomNavigationBar: new Container(
          height: 48.0,
          child: BottomAppBar(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Container(
                  child: Text("赞同"),
                  decoration: new BoxDecoration(
                      color: Colors.black26,
                      borderRadius:
                          new BorderRadius.all(Radius.circular(24.0))),
                  padding: EdgeInsets.only(
                      top: 12.0, left: 24.0, right: 24.0, bottom: 12.0),
                ),
                new Row(
                  children: <Widget>[
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.favorite),
                        Text(
                          "感谢",
                          style: TextStyle(fontSize: 10.0),
                        )
                      ],
                    ),
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.star),
                        Text(
                          "收藏",
                          style: TextStyle(fontSize: 10.0),
                        )
                      ],
                    ),
                    new GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(new MaterialPageRoute(builder: (context) {
                              return CommentPage(id);
                        }));
                      },
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.comment),
                          Text(
                            "评论",
                            style: TextStyle(fontSize: 10.0),
                          )
                        ],
                      ),
                    ),
                    new Padding(padding: EdgeInsets.all(8.0)),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
