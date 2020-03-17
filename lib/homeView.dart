import 'package:flutter/material.dart';
import 'package:krepm_new/qrCodeView.dart';
import 'package:krepm_new/stockView.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cells/stockCellWidget.dart';
import 'customWidgets/bottomTabBar.dart';
import 'customWidgets/logoWidget.dart';
import 'customWidgets/profileWidget.dart';
import 'models/profileCard.dart';
import 'models/stock.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Stock stock;

  ProfileCard _profileCard;

  @override
  void initState() {
    super.initState();
    stock = Stock(
      img: 'https://i.picsum.photos/id/210/500/500.jpg',
      title: "«Гарантия низких цен»!",
      description: "Нашли дешевле? Снизим цену!"
    );
    _getProfile();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

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
                Center(child:
                  Container(width: width * 0.8, child: logoWidget()),
                ),
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
                              MaterialPageRoute(builder: (context) => QRCodeView(cardNumber: "KREPM" + _profileCard.card,))
                            );
                          },
                          child: Container(
                            height: 160 * screenRatio,
                            child: ProfileWidget(profileCard: _profileCard,),
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

  void _getProfile() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _profileCard = ProfileCard(
        sum: prefs.getString('sum'),
        nextSum: prefs.getString('nextSum'),
        percent: prefs.getString('percent'),
        card: prefs.getString('card')
      );
    });
  }

}