import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AskQuestionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AskQuestionPageState();
  }
}

class _AskQuestionPageState extends State<AskQuestionPage> {

  TextEditingController questionController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    questionController.addListener((){
      if(questionController.text.length > 0) {
        Fluttertoast.showToast(msg: questionController.text);
      }
    });
    return new Scaffold(
      appBar: AppBar(
        title: Text("提问"),
        actions: <Widget>[
          new Container(
              margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
              child: new Align(
                alignment: Alignment.center,
                child: Text(
                  "下一步",
                  style: TextStyle(color: Colors.blue, fontSize: 16.0),
                ),
              )),
        ],
      ),
      body: new Container(
        child: TextField(
          maxLines: 100,
          decoration: new InputDecoration(hintText: "输入问题并以问号结尾"),
          controller: questionController,
        ),
        margin: EdgeInsets.all(16.0),
      ),
    );
  }
}
