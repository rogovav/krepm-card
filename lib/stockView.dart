import 'package:flutter/material.dart';
import 'package:krepm_new/customWidgets/bottomTabBar.dart';
import 'package:krepm_new/models/stock.dart';

class StockView extends StatelessWidget {
  const StockView({Key key, this.stock}) : super(key: key);
  final Stock stock;

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
          bottomNavigationBar: BottomTabBar(currentIndex: 3),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Color.fromRGBO(249, 241, 10, .9)),
            title: Text(stock.title, style: TextStyle(color: Color.fromRGBO(249, 241, 10, .9))),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: SafeArea(
            child: Container(
              color: Colors.transparent,
              child: Expanded(
                child: ListView(
                  children: <Widget>[ 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 200 * screenRatio,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(stock.img),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(stock.description,
                            style: TextStyle(color: Color.fromRGBO(249, 241, 10, .9)),
                          ),
                        ),
                      ],
                    )
                  ]
                )
              )
            ),
          )
        ),
      ],
    );
  }
}
