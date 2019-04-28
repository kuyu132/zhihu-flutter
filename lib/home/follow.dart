import 'package:flutter/material.dart';
import 'package:flutter_zhihu/network/model/follow_item.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'page_content.dart';

class Follow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FollowState();
}

class _FollowState extends State<Follow> {
  Widget generateDivider() {
    return new Container(
      height: 4.0,
      color: Colors.white10,
    );
  }

  Widget intrestPerson(String imgName) {
    return new Container(
      width: 32.0,
      height: 32.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.0, color: Colors.white),
          image: new DecorationImage(
            image: new NetworkImage(imgName),
          )),
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    Fluttertoast.showToast(msg: items[index].title);
    return new Text(items[index].title);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView(
        children: <Widget>[
          new Padding(padding: EdgeInsets.all(8.0)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.only(left: 16.0)),
                  Text("发现更多感兴趣的人"),
                ],
              ),
              new Container(
                child: new Row(
                  children: <Widget>[
                    intrestPerson(
                        "https://pic1.zhimg.com/v2-77a117348b4156a244238d9ece687c8a_xl.jpg"),
                    intrestPerson(
                        "https://pic4.zhimg.com/v2-6c834533a2d0ac90a18f3c0790fc5876_xl.jpg"),
                    intrestPerson(
                        "https://pic2.zhimg.com/871ac5e95d09e7635e0d9354436865fc_xl.jpg"),
                    intrestPerson(
                        "https://pic2.zhimg.com/v2-d626957872f9b38fa594394db2d2e6e7_xl.jpg"),
                    Icon(Icons.arrow_right),
                  ],
                ),
              ),
            ],
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 16, 0, 0)),
          //列表开始
          ListInclude(items),
        ],
      ),
    );
  }
}

/**
 * 两级listview嵌套
 */
class ListInclude extends StatelessWidget {
  List<FolloItem> items;

  ListInclude(this.items);

  Widget _listItemBuilder(BuildContext context, int index) {
    FolloItem item = items[index];
    return new GestureDetector(
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          return new PageContent(
            title: item.title,
            imageUrl: item.authorImgUrl,
            digest: item.digest,
          );
        }));
      },
      child: new Container(
        margin: EdgeInsets.all(8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: new NetworkImage(items[index].authorImgUrl)),
                      shape: BoxShape.circle),
                ),
                new Padding(padding: EdgeInsets.only(left: 16.0)),
                new Text(items[index].name),
                new Icon(Icons.star),
                new Text("回答了问题"),
                new Text("  ·  "),
                new Text(items[index].timeStamp),
              ],
            ),
            new Padding(padding: EdgeInsets.only(top: 8.0)),
            new Text(
              items[index].title,
              style: TextStyle(fontSize: 16.0),
            ),
            new Padding(padding: EdgeInsets.only(top: 8.0)),
            new Text(items[index].digest),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Text(
                      items[index].agreeNum.toString() + "赞同  ·  ",
                      style: TextStyle(color: Colors.white24),
                    ),
                    new Text(
                      items[index].commentNum.toString() + " 评论",
                      style: TextStyle(color: Colors.white24),
                    ),
                  ],
                ),
                new Icon(Icons.more),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: _listItemBuilder,
        separatorBuilder: (context, index) => new Container(
              height: 4.0,
              color: Colors.white10,
            ),
        itemCount: items.length);
  }
}
