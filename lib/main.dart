import 'package:flutter/material.dart';
import 'package:krepm_new/customWidgets/logoWidget.dart';
import 'package:krepm_new/customWidgets/profileWidget.dart';
import 'package:krepm_new/customWidgets/stocksWidget.dart';
import 'package:flutter/services.dart';

void main() => runApp(KrepMApp());

class KrepMApp extends StatelessWidget {
  // This widget is the root of your application.
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
      theme: ThemeData(
        primaryColor: Color.fromRGBO(67, 38, 25, 1)
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/background_blur.png'),
                fit: BoxFit.cover,
              ),
            ),
            // color: Color.fromRGBO(67, 38, 25, .5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.8,
                      child: logoWidget()
                    ),
                  ]
                ),
                SizedBox(height: 10,),
                Container(
                  width: width * 0.9,
                  child: ProfileWidget(),
                ),
                SizedBox(height: 10,),
                Container(
                  width: width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Новости и акции", 
                        style: TextStyle(
                          color: Color.fromRGBO(248, 7, 7, .8),
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ]
                  ),
                ),
                SizedBox(height: 5,),
                Flexible(
                  child: Container(
                    width: width * 0.9,
                    child: StocksWidget(),
                  ),
                ),
              ]
            )
          ),
        ),
      ),
    );
  }
}
