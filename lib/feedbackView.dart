import 'package:flutter/material.dart';
import 'package:krepm_new/customWidgets/bottomTabBar.dart';
import 'package:krepm_new/customWidgets/logoWidget.dart';

class FeedbackPage extends StatelessWidget {

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
        bottomNavigationBar: BottomTabBar(currentIndex: 4),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromRGBO(249, 241, 10, .9)),
          title: Text("Обратная связь", style: TextStyle(color: Color.fromRGBO(249, 241, 10, .9))),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Container(
            color: Colors.transparent,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  //   Container(width: width * 0.8, child: logoWidget()),
                  // ]),
                  // SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: Color.fromRGBO(249, 241, 10, .4),
                        hintColor: Color.fromRGBO(249, 241, 10, .4),
                      ),
                      child: TextField(
                        obscureText: true,
                        maxLength: 50,
                        style: TextStyle(color: Color.fromRGBO(249, 241, 10, .9)),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(67, 38, 25, 1),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(249, 241, 10, .4)
                            )
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Color.fromRGBO(249, 241, 10, .4)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: Color.fromRGBO(249, 241, 10, .4),
                        hintColor: Color.fromRGBO(249, 241, 10, .4)
                      ),
                      child: TextField(
                        // obscureText: true,
                        maxLength: 200,
                        minLines: 1,
                        maxLines: 5,
                        style: TextStyle(color: Color.fromRGBO(249, 241, 10, .9)),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(67, 38, 25, 1),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(249, 241, 10, .4)
                            )
                          ),
                          labelText: 'Вопрос',
                          labelStyle: TextStyle(color: Color.fromRGBO(249, 241, 10, .4)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ButtonTheme(
                      minWidth: width,
                      height: 50.0,
                      buttonColor: Color.fromRGBO(249, 241, 10, .9),
                      child: RaisedButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(4.0),
                        ),
                        child: Text(
                          "Отправить",
                          style: TextStyle(fontSize: 15, color: Color.fromRGBO(248, 7, 7, .9)),
                        ),
                      ),
                    )
                  )
                ]
              )
            ),
          ),
        )
      ),
    ]);
  }
}
