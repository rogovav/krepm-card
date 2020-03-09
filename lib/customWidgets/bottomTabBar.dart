import 'package:flutter/material.dart';
import 'package:krepm_new/main.dart';
import 'package:krepm_new/moreView.dart';
import 'package:krepm_new/stocksView.dart';
import 'package:krepm_new/profileView.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({Key key, this.currentIndex}) : super(key: key);
  final int currentIndex;
  static List pages = [HomePage(), ProfileView(), StocksPage(), MorePage()];

  @override
  Widget build(BuildContext context) {
  
    void onTabTapped(int index) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => pages[index])
      );
    }

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(67, 38, 25, 1),
        primaryColor: Color.fromRGBO(249, 241, 10, .9),
        textTheme: Theme.of(context).textTheme.copyWith(
          caption: TextStyle(color: Color.fromRGBO(249, 241, 10, .4))
        )
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 25),
            title: Text("Главная", style: TextStyle(fontSize: 10)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on, size: 25),
            title: Text("Магазины", style: TextStyle(fontSize: 10)),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.credit_card, size: 25),
          //   title: Text("Профиль", style: TextStyle(fontSize: 10)),
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.style, size: 25),
            title: Text("Акции", style: TextStyle(fontSize: 10)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz, size: 25),
            title: Text("Ещё", style: TextStyle(fontSize: 10)),
          )
        ]
      )
    );
  }
}