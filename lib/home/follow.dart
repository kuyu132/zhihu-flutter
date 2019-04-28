import 'package:flutter/material.dart';

class Follow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FollowState();
}

class _FollowState extends State<Follow> {
  List<Widget> data;

  List<Widget> getData() {
    data = <Widget>[];
    data.add(generateDivider());
    data.add(generateItem());
    data.add(generateDivider());
    data.add(generateItem());
    data.add(generateDivider());
    data.add(generateItem());
    data.add(generateDivider());
    data.add(generateItem());
    data.add(generateDivider());
    data.add(generateItem());
    data.add(generateDivider());
    data.add(generateItem());
    data.add(generateDivider());
    data.add(generateItem());
    data.add(generateDivider());
    data.add(generateItem());
    data.add(generateDivider());
    return data;
  }

  Widget generateItem() {
    return new Container(
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
                        image: new NetworkImage(
                            "https://pic2.zhimg.com/v2-d626957872f9b38fa594394db2d2e6e7_xl.jpg")),
                    shape: BoxShape.circle),
              ),
              new Padding(padding: EdgeInsets.only(left: 16.0)),
              new Text("张佳玮"),
              new Icon(Icons.star),
              new Text("回答了问题"),
              new Text("  ·  "),
              new Text("18 小时前"),
            ],
          ),
          new Padding(padding: EdgeInsets.only(top: 8.0)),
          new Text(
            "雷霆vs开拓者：嘴上说不肯变，身体还是诚实的",
            style: TextStyle(fontSize: 16.0),
          ),
          new Padding(padding: EdgeInsets.only(top: 8.0)),
          new Text(
              "开拓者对雷霆前两场后，我自己在公号里吐槽过一句：四年了，雷霆一向如此。无论对任何球队，无论自己是强是弱，都是一根筋：短轮换、上夹击、拼强度。他们够顽强，所以第一场落后大半场还能扳回来，但少变通，第二场被开拓者的弱侧攻击打晕了。——当然我也就说说气话，我是不太相信一个NBA教练真会不根据对手玩花招的。可昨天多诺万教练接"),
          new Row(
            children: <Widget>[
              new Text(
                "258赞同  ·  ",
                style: TextStyle(color: Colors.white24),
              ),
              new Text(
                "24 评论",
                style: TextStyle(color: Colors.white24),
              ),
              new Padding(padding: EdgeInsets.only(left: 220.0)),
              new Icon(Icons.more),
            ],
          )
        ],
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView(
        children: <Widget>[
          new Padding(padding: EdgeInsets.all(8.0)),
          new Row(
            children: <Widget>[
              new Padding(padding: EdgeInsets.all(8.0)),
              Text("发现更多感兴趣的人"),
              new Container(
                margin: EdgeInsets.fromLTRB(110.0, 0, 0, 0),
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
                  ],
                ),
              ),
              Icon(Icons.arrow_right),
              new Padding(padding: EdgeInsets.fromLTRB(0, 0, 8, 0)),
            ],
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 16, 0, 0)),
          //列表开始
          getData()[0],
          getData()[1],
          getData()[2],
          getData()[3],
          getData()[4],
          getData()[5],
          getData()[6],
          getData()[7],
          getData()[8],
        ],
      ),
    );
  }
}
