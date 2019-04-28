import 'package:flutter/material.dart';
import 'package:flutter_zhihu/common/search_page.dart';
import 'package:flutter_zhihu/global_config.dart';
import 'package:flutter_zhihu/common/scan_page.dart';

class PersonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  Widget contentSearch() {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new FlatButton.icon(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return new SearchPage();
              }));
            },
            icon: new Icon(
              Icons.search,
              color: GlobalConfig.fontColor,
              size: 16.0,
            ),
            label: new Text(
              "搜索知乎内容",
              style: new TextStyle(color: GlobalConfig.fontColor),
            ),
          )),
          new IconButton(
            icon: new Icon(Icons.camera),
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return new ScanPage();
              }));
            },
          )
        ],
      ),
    );
  }

  Widget personInfo() {
    return new Container(
      color: Colors.black54,
      padding: const EdgeInsets.all(16.0),
      child: new Row(children: <Widget>[
        new Container(
          width: 64.0,
          height: 64.0,
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("images/head.jpg"), fit: BoxFit.fill),
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.white),
          ),
        ),
        new Padding(padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0)),
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.fromLTRB(12.0, 0, 0, 8),
              child: new Text("yu ku"),
            ),
            new Container(
              padding: EdgeInsets.all(4.0),
              child: new Row(
                children: <Widget>[
                  new Icon(Icons.star),
                  new Text(
                    "知乎盐值：386 >",
                    style: TextStyle(fontSize: 12.0),
                  )
                ],
              ),
              decoration: new BoxDecoration(
                color: Colors.black26,
                borderRadius: new BorderRadius.all(Radius.circular(15.0)),
              ),
            )
          ],
        ),
        new Padding(padding: EdgeInsets.fromLTRB(48.0, 0, 0, 0)),
        new Text("个人主页 >"),
      ]),
    );
  }

  Widget personTab() {
    return new Container(
      padding: const EdgeInsets.all(16.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Column(
            children: <Widget>[
              new Text("15"),
              new Text("我的创作"),
              new Text(
                "1草稿",
                style: TextStyle(color: Colors.black38),
              )
            ],
          ),
          new Container(
            width: 1.0,
            height: 30.0,
            decoration: new BoxDecoration(
                border: Border(
                    left: Divider.createBorderSide(context,
                        color: Colors.black26, width: 1.0))),
          ),
          new Column(
            children: <Widget>[
              new Text("206"),
              new Text("关注"),
            ],
          ),
          new Container(
            width: 1.0,
            height: 30.0,
            decoration: new BoxDecoration(
                border: Border(
                    left: Divider.createBorderSide(context,
                        color: Colors.black26, width: 1.0))),
          ),
          new Column(
            children: <Widget>[new Text("4"), new Text("收藏夹")],
          ),
          new Container(
            width: 1.0,
            height: 30.0,
            decoration: new BoxDecoration(
                border: Border(
                    left: Divider.createBorderSide(context,
                        color: Colors.black26, width: 1.0))),
          ),
          new Column(
            children: <Widget>[new Text("61"), new Text("最近浏览")],
          ),
        ],
      ),
    );
  }

  Widget becomeVIP() {
    return new Container(
        child: new Align(
      alignment: AlignmentDirectional.topStart,
      child: FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.card_membership),
          label: new Text("开通盐选会员")),
    ));
  }

  Widget part1() {
    return new Container(
        padding: EdgeInsets.fromLTRB(0, 16.0, 0, 16.0),
        child: new Column(
          children: <Widget>[
//            new Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                new Container(
//                  width: 1.0,
//                ),
//                new Column(
//                  children: <Widget>[
//                    new Icon(Icons.dock),
//                    new Text("学习记录"),
//                  ],
//                ),
//                new Column(
//                  children: <Widget>[
//                    new Icon(Icons.store),
//                    new Text("已购"),
//                  ],
//                ),
//                new Column(
//                  children: <Widget>[
//                    new Icon(Icons.store),
//                    new Text("余额礼券"),
//                  ],
//                ),
//                new Column(
//                  children: <Widget>[
//                    new Icon(Icons.store),
//                    new Text("读书会"),
//                  ],
//                ),
//                new Container(
//                  width: 1.0,
//                ),
//              ],
//            ),
            new Padding(padding: new EdgeInsets.all(8.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Icon(Icons.dock),
                new Icon(Icons.store),
                new Icon(Icons.dock),
                new Icon(Icons.store),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text("学习记录"),
                new Text("已购"),
                new Text("余额礼券"),
                new Text("读书会"),
              ],
            ),
            new Padding(padding: EdgeInsets.only(top: 16.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Icon(Icons.dock),
                new Icon(Icons.store),
                new Icon(Icons.dock),
                new Icon(Icons.store),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text("我的书架"),
                new Text("下载中心"),
                new Text("付费咨询"),
                new Text("活动广场"),
              ],
            ),
//            new Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                new Container(
//                  width: 1.0,
//                ),
//                new Column(
//                  children: <Widget>[
//                    new Icon(Icons.dock),
//                    new Text("我的书架"),
//                  ],
//                ),
//                new Column(
//                  children: <Widget>[
//                    new Icon(Icons.store),
//                    new Text("下载中心"),
//                  ],
//                ),
//                new Column(
//                  children: <Widget>[
//                    new Icon(Icons.store),
//                    new Text("付费咨询"),
//                  ],
//                ),
//                new Column(
//                  children: <Widget>[
//                    new Icon(Icons.store),
//                    new Text("活动广场"),
//                  ],
//                ),
//                new Container(
//                  width: 1.0,
//                ),
//              ],
//            ),
          ],
        ));
  }

  Widget part2() {
    return new Container(
      padding: EdgeInsets.fromLTRB(0, 16.0, 0, 16.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Container(
            width: 1.0,
          ),
          new Column(
            children: <Widget>[new Icon(Icons.terrain), new Text("社区建设")],
          ),
          new Column(
            children: <Widget>[
              new Icon(Icons.perm_scan_wifi),
              new Text("反馈与帮助")
            ],
          ),
          new Column(
            children: <Widget>[new Icon(Icons.date_range), new Text("夜间模式")],
          ),
          new Column(
            children: <Widget>[new Icon(Icons.settings), new Text("设置")],
          ),
          new Container(
            width: 1.0,
          ),
        ],
      ),
    );
  }

  Widget createCenter() {
    return new Column(
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.pages),
                label: new Text("回答问题")),
            new Align(
              child: new Row(
                children: <Widget>[
                  new Text("更多问题"),
                  new Icon(Icons.arrow_right),
                  new Padding(padding: EdgeInsets.only(right: 8.0)),
                ],
              ),
            ),
          ],
        ),
        new Padding(padding: EdgeInsets.fromLTRB(0, 8.0, 0, 0)),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Text("昨日回答阅读数"),
                new Text("21"),
                new Text("较前日 19.23%")
              ],
            ),
            new Container(
              width: 1.0,
              height: 30.0,
              decoration: new BoxDecoration(
                  border: Border(
                      left: Divider.createBorderSide(context,
                          color: Colors.black26, width: 1.0))),
            ),
            new Column(
              children: <Widget>[
                new Text("昨日回答赞同数"),
                new Text("0"),
                new Text("较前日 --")
              ],
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(
            title: contentSearch(),
          ),
          body: new ListView(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  personInfo(),
                  personTab(),
                  new Container(
                    height: 12.0,
                    color: Colors.black12,
                  ),
                  becomeVIP(),
                  new Container(
                    height: 12.0,
                    color: Colors.black12,
                  ),
                  part1(),
                  new Container(
                    height: 12.0,
                    color: Colors.black12,
                  ),
                  part2(),
                  new Container(
                    height: 12.0,
                    color: Colors.black12,
                  ),
                  createCenter(),
                ],
              ),
            ],
          )),
    );
  }
}
