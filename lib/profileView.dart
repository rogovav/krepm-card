import 'package:flutter/material.dart';
import 'package:krepm_new/customWidgets/bottomTabBar.dart';
import 'package:krepm_new/customWidgets/profileWidget.dart';

class ProfileView extends StatelessWidget {
  final List buys = [
    ['01.02.2019', '2 342'],
    ['03.02.2019', '386'],
    ['01.04.2019', '9 145'],
    ['01.02.2019', '2 342'],
    ['03.02.2019', '386'],
    ['01.04.2019', '9 145'],
    ['01.02.2019', '2 342'],
    ['03.02.2019', '386'],
    ['01.04.2019', '9 145'],
    ['01.02.2019', '2 342'],
    ['03.02.2019', '386'],
    ['01.04.2019', '9 145'],
    ['01.02.2019', '2 342'],
    ['03.02.2019', '386'],
    ['01.04.2019', '9 145'],
    ['01.02.2019', '2 342'],
    ['03.02.2019', '386'],
    ['01.04.2019', '9 145'],
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
          bottomNavigationBar: BottomTabBar(currentIndex: 2),
          body: SafeArea(
            child: Container(
              color: Colors.transparent,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: width * 0.9,
                      child: ProfileWidget(),
                    ),
                    SizedBox(height: 5),
                    Flexible(
                      child: Container(
                        width: width * 0.9,
                        child: ListView.separated(
                          padding: const EdgeInsets.all(8),
                          itemCount: buys.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              // height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(buys[index][0], style: TextStyle(color: Color.fromRGBO(249, 241, 10, .9)),),
                                  Text(buys[index][1] + " ₽", style: TextStyle(color: Color.fromRGBO(249, 241, 10, .9)),),
                                ]
                              ) 
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) => const Divider(),
                        )
                      ),
                    ),
                  ]
                )
              ),
            ),
          )
        ),
      ],
    );
  }
}
