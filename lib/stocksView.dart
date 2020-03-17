import 'package:flutter/material.dart';
import 'package:krepm_new/customWidgets/bottomTabBar.dart';
import 'package:krepm_new/customWidgets/logoWidget.dart';
import 'package:krepm_new/customWidgets/stocksWidget.dart';

class StocksPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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
        bottomNavigationBar: BottomTabBar(currentIndex: 1),
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
                    child: StocksWidget()
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
