import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeView extends StatelessWidget {
  final String cardNumber;

  QRCodeView({Key key, @required this.cardNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double screenRatio = width / 320;

    return Stack(
      children: <Widget>[
        new Container(
          height: double.infinity,
          width: double.infinity,
          decoration:new BoxDecoration(
            image: new DecorationImage(
              image: AssetImage('assets/img/background_blur.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Карта покупателя", style: TextStyle(color: Color.fromRGBO(249, 241, 10, .9))),
            iconTheme: IconThemeData(color: Color.fromRGBO(249, 241, 10, .9)),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              icon: new Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(null),
            ),
          ),
          body: SafeArea(
            child: Container(
              child: Center(
                child: Container(
                  color: Colors.white,
                  width: width * 0.7,
                  height: width * 0.7,
                  padding: EdgeInsets.all(0),
                  child: QrImage(
                    data: cardNumber,
                    version: QrVersions.auto,
                    padding: EdgeInsets.all(screenRatio > 1 ? 10 : 5),
                  ),
                ),
              ),
            ),
          )
        ),
      ],
    );
  }
}
