import 'package:flutter/material.dart';
import 'package:krepm_new/customWidgets/bottomTabBar.dart';
import 'package:krepm_new/customWidgets/logoWidget.dart';
import 'package:krepm_new/customWidgets/profileWidget.dart';
import 'package:flutter/services.dart';
import 'package:krepm_new/qrCodeView.dart';
import 'package:krepm_new/stockView.dart';
import 'package:krepm_new/cells/stockCellWidget.dart';
import 'package:krepm_new/models/stock.dart';

void main() => runApp(KrepMApp());

class KrepMApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'КРЕП.М',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color.fromRGBO(67, 38, 25, 1)),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final Stock stock = Stock(
    img: 'https://i.picsum.photos/id/210/500/500.jpg',
    title: "«Гарантия низких цен»!",
    description: "Нашли дешевле? Снизим цену!"
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double screenRatio = width / 320;

    return Stack(children: [
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background_blur.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomTabBar(currentIndex: 0),
        body: SafeArea(
          child: Container(
            color: Colors.transparent,
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(width: width * 0.8, child: logoWidget()),
                ]),
                SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => QRCodeView())
                            );
                          },
                          child: Container(
                            height: 160 * screenRatio,
                            child: ProfileWidget(),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Акция дня!",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromRGBO(249, 241, 10, .9),
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                                ),
                              ]
                            ),
                        ),
                        SizedBox(height: 5),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => StockView())
                              );
                            },
                            child: Container(
                              width: width * 0.9,
                              child: stockCell(context: context, stock: stock)
                            ),
                          ),
                        ),
                      ]
                      ),
                  )
                ),
              ])
            ),
          ),
        )
      ),
    ]);
  }
}
