import 'package:flutter/material.dart';
import 'package:krepm_new/customWidgets/bottomTabBar.dart';
import 'package:krepm_new/customWidgets/logoWidget.dart';
import 'package:krepm_new/feedbackView.dart';

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
        bottomNavigationBar: BottomTabBar(currentIndex: 4),
        body: SafeArea(
          child: Container(
            color: Colors.transparent,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(width: width * 0.8, child: logoWidget()),
                  ]),
                  SizedBox(height: 20),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text(
                      "Программа лояльности",
                      style: TextStyle(
                        color: Color.fromRGBO(249, 241, 10, .9), 
                        fontSize: 16, 
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20), 
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FeedbackPage())
                        );
                      },
                      child: Text(
                        "Обратная связь",
                        style: TextStyle(
                          color: Color.fromRGBO(249, 241, 10, .9), 
                          fontSize: 16, 
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline
                        ),
                      ),
                    )
                  ),
                  SizedBox(height: 20),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text(
                      "Для юридических лиц",
                      style: TextStyle(
                        color: Color.fromRGBO(248, 7, 7, .9), 
                        fontSize: 16, 
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text(
                      "О компании",
                      style: TextStyle(
                        color: Color.fromRGBO(249, 241, 10, .9), 
                        fontSize: 16, 
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline
                      ),
                    ),
                  ),
                ]
              )
            ),
          ),
        )
      ),
    ]);
  }
}
