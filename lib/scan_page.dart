import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class ScanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ScanPageState();
  }
}

class _ScanPageState extends State<ScanPage> {
  String barcode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("QR code"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: RaisedButton(
                onPressed: scan,
                color: Colors.orange,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                child: const Text("Start Camera Scan"),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                barcode,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        return this.barcode = barcode;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          return this.barcode = "The user did not grant the camera permission";
        });
      } else {
        setState(() {
          return this.barcode = "unknow error: $e";
        });
      }
    } on FormatException {
      setState(() {
        setState(() => this.barcode =
            'null (User returned using the "back"-button before scanning anything. Result)');
      });
    } catch (e) {
      setState(() => this.barcode = 'Unknow error: $e');
    }
  }
}
