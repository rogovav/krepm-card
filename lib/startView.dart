import 'package:flutter/material.dart';
import 'package:krepm_new/loginView.dart';
import 'package:krepm_new/registrationView.dart';
import 'customWidgets/logoWidget.dart';
import 'homeView.dart';

class StartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
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
          body: SafeArea(
            child: Container(
              color: Colors.transparent,
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(child:
                        Container(width: width * 0.8, child: logoWidget()),
                      ),
                      SizedBox(height: 70),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20), 
                        child: ButtonTheme(
                          minWidth: width,
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => LoginView())
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              side: BorderSide(color: Color.fromRGBO(67, 38, 25, 1))
                            ),
                            color: Color.fromRGBO(249, 241, 10, .9),
                            child: Text(
                              'Вход',
                              style: TextStyle(
                                color: Color.fromRGBO(248, 7, 7, .9), 
                                fontSize: 16, 
                                fontWeight: FontWeight.bold,
                              )
                            ),
                          ),
                        )
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20), 
                        child: ButtonTheme(
                          minWidth: width,
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => RegistrationView())
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              side: BorderSide(color: Color.fromRGBO(67, 38, 25, 1))
                            ),
                            color: Color.fromRGBO(248, 7, 7, .9),
                            child: Text(
                              'Регистрация',
                              style: TextStyle(
                                color: Color.fromRGBO(249, 241, 10, .9), 
                                fontSize: 16, 
                                fontWeight: FontWeight.bold,
                              )
                            ),
                          ),
                        )
                      ),
                      SizedBox(height: 70),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20), 
                        child: Center(
                          child: GestureDetector(
                            onTap: () { 
                                Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => HomeView())
                              ); 
                            },
                            child: Text(
                              "Временная карта",
                              style: TextStyle(
                                color: Color.fromRGBO(249, 241, 10, .9), 
                                fontSize: 12, 
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ),
                        )
                      ),
                    ]
                )
              )
            )
          ),
        )
      ],
    );
  }
}
