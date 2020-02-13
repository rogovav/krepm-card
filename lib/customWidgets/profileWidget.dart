import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Color.fromRGBO(67, 38, 25, 1),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Color.fromRGBO(249, 241, 10, .15), width: 1.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        "Сумма покупок:", 
                        style: TextStyle(
                          color: Color.fromRGBO(255, 204, 183, 1),
                          fontSize: 13
                        ),
                      ),
                      SizedBox(height: 3,),
                      Text(
                        "35 275 ₽", 
                        style: TextStyle(
                          color: Color.fromRGBO(249, 241, 10, 1),
                          fontSize: 26
                        ),
                      ),
                    ]
                  ),
                  Container(
                    width: 49,
                    height: 49,
                    child: Image(image: AssetImage('assets/img/barcode.png')),
                  )
                ],
              ),
              SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "3%", 
                    style: TextStyle(
                      color: Color.fromRGBO(255, 204, 183, 1),
                      fontSize: 13
                    )
                  ),
                  Text(
                    "5%", 
                    style: TextStyle(
                      color: Color.fromRGBO(255, 204, 183, 1),
                      fontSize: 13
                    )
                  ),
                ],
              ),
              SizedBox(height: 5,),
              SizedBox(
                height: 4,
                child: LinearProgressIndicator(
                  backgroundColor: Color.fromRGBO(156, 114, 95, 1),
                  value: 0.70,
                  valueColor: AlwaysStoppedAnimation(Color.fromRGBO(248, 7, 7, 1)),
                ),
              ),
              SizedBox(height: 5,),
              RichText(text: TextSpan(children: [
                TextSpan(
                  text: 'До повышения бонусного уровня осталось набрать на ', 
                  style: TextStyle(color: Color.fromRGBO(249, 241, 10, 0.7), fontSize: 10)
                ),
                TextSpan(
                  text: '2 832 ₽',
                  style: TextStyle(color: Color.fromRGBO(249, 241, 10, 1), fontSize: 10, fontWeight: FontWeight.bold)
                )
              ]))
            ]
          ),
        )
      ),
    );
  }
}