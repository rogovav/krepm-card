import 'package:flutter/material.dart';
import 'package:krepm_new/customWidgets/bottomTabBar.dart';
import 'package:krepm_new/customWidgets/logoWidget.dart';
import 'package:krepm_new/startView.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MorePage extends StatelessWidget {

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
        bottomNavigationBar: BottomTabBar(currentIndex: 2),
        body: SafeArea(
          child: Container(
            color: Colors.transparent,
            child: Container(
              child: ListView(
                children: [
                  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Center(child:
                      Container(width: width * 0.8, child: logoWidget()),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20), 
                      child: ButtonTheme(
                        minWidth: width,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            side: BorderSide(color: Color.fromRGBO(67, 38, 25, 1))
                          ),
                          color: Color.fromRGBO(249, 241, 10, .9),
                          child: Text(
                            'Программа лояльности',
                            style: TextStyle(
                              color: Color.fromRGBO(248, 7, 7, .9), 
                              fontSize: 16, 
                              fontWeight: FontWeight.bold,
                            )
                          ),
                        ),
                      )
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20), 
                      child: ButtonTheme(
                        minWidth: width,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            side: BorderSide(color: Color.fromRGBO(67, 38, 25, 1))
                          ),
                          color: Color.fromRGBO(249, 241, 10, .9),
                          child: Text(
                            'Обратная связь',
                            style: TextStyle(
                              color: Color.fromRGBO(248, 7, 7, .9), 
                              fontSize: 16, 
                              fontWeight: FontWeight.bold,
                            )
                          ),
                        ),
                      )
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20), 
                      child: ButtonTheme(
                        minWidth: width,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            side: BorderSide(color: Color.fromRGBO(67, 38, 25, 1))
                          ),
                          color: Color.fromRGBO(249, 241, 10, .9),
                          child: Text(
                            'О компании',
                            style: TextStyle(
                              color: Color.fromRGBO(248, 7, 7, .9), 
                              fontSize: 16, 
                              fontWeight: FontWeight.bold,
                            )
                          ),
                        ),
                      )
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20), 
                      child: ButtonTheme(
                        minWidth: width,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            side: BorderSide(color: Color.fromRGBO(67, 38, 25, 1))
                          ),
                          color: Color.fromRGBO(249, 241, 10, .9),
                          child: Text(
                            'Личные данные',
                            style: TextStyle(
                              color: Color.fromRGBO(248, 7, 7, .9), 
                              fontSize: 16, 
                              fontWeight: FontWeight.bold,
                            )
                          ),
                        ),
                      )
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20), 
                      child: ButtonTheme(
                        minWidth: width,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            side: BorderSide(color: Color.fromRGBO(67, 38, 25, 1))
                          ),
                          color: Color.fromRGBO(249, 241, 10, .9),
                          child: Text(
                            'История начислений',
                            style: TextStyle(
                              color: Color.fromRGBO(248, 7, 7, .9), 
                              fontSize: 16, 
                              fontWeight: FontWeight.bold,
                            )
                          ),
                        ),
                      )
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20), 
                      child: ButtonTheme(
                        minWidth: width,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            side: BorderSide(color: Color.fromRGBO(67, 38, 25, 1))
                          ),
                          color: Color.fromRGBO(248, 7, 7, .9),
                          child: Text(
                            'Для юридических лиц',
                            style: TextStyle(
                              color: Color.fromRGBO(249, 241, 10, .9), 
                              fontSize: 16, 
                              fontWeight: FontWeight.bold,
                            )
                          ),
                        ),
                      )
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20), 
                      child: Center(
                        child: GestureDetector(
                            onTap: () { 
                              _logout(context);
                            },
                            child: Text(
                              "Выйти",
                              style: TextStyle(
                                color: Color.fromRGBO(249, 241, 10, .9), 
                                fontSize: 16, 
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        )
                      ),
                      SizedBox(height: 30),
                    ]
                  )
                ]
              )
            ),
          ),
        )
      ),
    ]);
  }

  void _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => StartView())
    );
  }
}
