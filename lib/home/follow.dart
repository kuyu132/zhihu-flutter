import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'page_content.dart';
import 'package:flutter_zhihu/network/network.dart';
import 'package:flutter_zhihu/network/model/follow_item_response.dart';

class Follow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FollowState();
}

class _FollowState extends State<Follow> {
  List<Stories> storyList = new List();
  int index = 0;

  @override
  void initState() {
    super.initState();
    HttpManager httpManager = new HttpManager();
    httpManager.getLatestNews().then((response) {
      setState(() {
        storyList.addAll(convertTopStoriesToStories(response));
      });
    });
  }

  List<Stories> convertTopStoriesToStories(FollowItemResponse response) {
    List<Top_stories> topStories = response.top_stories;
    List<Stories> result =
        new List();
    for (Top_stories top_story in topStories) {
      List<String> images = new List();
      images.add(top_story.image);
      result.add(Stories(
          ga_prefix: top_story.ga_prefix,
          id: top_story.id,
          title: top_story.title,
          images: images,
          type: top_story.type));
    }
    result.addAll(response.stories);
    return result;
  }

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
    Fluttertoast.showToast(msg: storyList[index].title);
    return new Text(storyList[index].title);
  }

  @override
  Widget build(BuildContext context) {
    double rightOffset = 24.0;
    return new Container(
      child: new ListView(
        children: <Widget>[
          new Padding(padding: EdgeInsets.all(8.0)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Container(
                child: Text("发现更多感兴趣的人"),
                margin: EdgeInsets.only(left: 24.0),
              ),
              new Expanded(
                child: new Stack(
                  alignment: Alignment.centerRight,
                  children: <Widget>[
                    Positioned(
                      child: intrestPerson(
                          "https://pic1.zhimg.com/v2-77a117348b4156a244238d9ece687c8a_xl.jpg"),
                      right: 72.0 + rightOffset,
                    ),
                    Positioned(
                      child: intrestPerson(
                          "https://pic4.zhimg.com/v2-6c834533a2d0ac90a18f3c0790fc5876_xl.jpg"),
                      right: 48.0 + rightOffset,
                    ),
                    Positioned(
                      child: intrestPerson(
                          "https://pic2.zhimg.com/871ac5e95d09e7635e0d9354436865fc_xl.jpg"),
                      right: 24.0 + rightOffset,
                    ),
                    Positioned(
                      child: intrestPerson(
                          "https://pic2.zhimg.com/v2-d626957872f9b38fa594394db2d2e6e7_xl.jpg"),
                      right: rightOffset,
                    ),
                    Container(
                      height: 32.0,
                      child: Icon(Icons.arrow_right),
                    ),
                  ],
                ),
              ),
            ],
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 16, 0, 0)),
          //列表开始
          ListInclude(storyList),
        ],
      ),
    );
  }
}

/**
 * 两级listview嵌套
 */
class ListInclude extends StatelessWidget {
  List<Stories> items = new List();

  ListInclude(this.items);

  Widget _listItemBuilder(BuildContext context, int index) {
    Stories item = items[index];
    return new GestureDetector(
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          return new PageContent(
            id: item.id,
            title: item.title,
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
                          image: new NetworkImage(items[index].images[0])),
                      shape: BoxShape.circle),
                ),
                new Padding(padding: EdgeInsets.only(left: 16.0)),
                new Text(items[index].title.substring(0, 4)),
                new Icon(Icons.star),
                new Text("回答了问题"),
                new Text("  ·  "),
                new Text(items[index].ga_prefix),
              ],
            ),
            new Padding(padding: EdgeInsets.only(top: 8.0)),
            new Text(
              items[index].title,
              style: TextStyle(fontSize: 16.0),
            ),
            new Padding(padding: EdgeInsets.only(top: 8.0)),
            new Text(items[index].title),
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
        itemCount: items == null ? 0 : items.length);
  }
}
