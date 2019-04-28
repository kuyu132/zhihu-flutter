import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_zhihu/index.dart';

class LoadingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoadingPageState();
  }
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(Duration(seconds: 3), () {
      print("flutter仿知乎正在启动");
      Navigator.of(context)
          .pushReplacement(new MaterialPageRoute(builder: (context) {
        return ZhiHu();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(child: Image.asset("images/index.png"));
  }
}

class ZhiHu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "知乎-仿",
      home: new Index(),
    );
  }
}
