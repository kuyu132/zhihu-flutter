import 'package:flutter/material.dart';
import 'navigation_icon_view.dart';
import 'home_page.dart';
import 'idea_page.dart';
import 'member_page.dart';
import 'notification_page.dart';
import 'person_page.dart';
import 'package:flutter_zhihu/global_config.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _IndexState();
}

class _IndexState extends State<Index> with TickerProviderStateMixin {
  int _curIndex = 0;
  List<NavigationIconView> _navigationViews;
  StatefulWidget _curPage;
  List<StatefulWidget> _pageList;

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
          icon: new Icon(Icons.assignment), title: new Text("首页"), vsync: this),
      new NavigationIconView(
          icon: new Icon(Icons.all_inclusive),
          title: new Text("想法"),
          vsync: this),
      new NavigationIconView(
          icon: new Icon(Icons.card_membership),
          title: new Text("会员"),
          vsync: this),
      new NavigationIconView(
          icon: new Icon(Icons.notifications),
          title: new Text("消息"),
          vsync: this),
      new NavigationIconView(
          icon: new Icon(Icons.perm_identity),
          title: new Text("我的"),
          vsync: this)
    ];
    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }
    _pageList = <StatefulWidget>[
      new HomePage(),
      new IdeaPage(),
      new MemberPage(),
      new NotificationPage(),
      new PersonPage()
    ];
    _curPage = _pageList[_curIndex];
  }

  void _rebuild() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    for (NavigationIconView view in _navigationViews) {
      view.controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
        items: _navigationViews
            .map((NavigationIconView view) => view.item)
            .toList(),
        currentIndex: _curIndex,
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _navigationViews[_curIndex].controller.reverse();
            _curIndex = index;
            _navigationViews[_curIndex].controller.forward();
            _curPage = _pageList[_curIndex];
//            Fluttertoast.showToast(
//                msg: "index" + index.toString() + _curPage.toStringShort());
          });
        });
    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: _curPage,
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
      theme: GlobalConfig.themeData,
    );
  }
}
