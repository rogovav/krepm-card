import 'package:flutter/material.dart';
import 'package:krepm_new/models/profileCard.dart';
import 'package:krepm_new/qrCodeView.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileWidget extends StatelessWidget {
  final ProfileCard profileCard;

  const ProfileWidget({Key key, @required this.profileCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenRatio = MediaQuery.of(context).size.width / 320;
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
              image: AssetImage("assets/img/card_background.png"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          fontSize: 13 * screenRatio
                        ),
                      ),
                      SizedBox(height: 3,),
                      Text(
                        profileCard.sum, 
                        style: TextStyle(
                          color: Color.fromRGBO(249, 241, 10, 1),
                          fontSize: 26 * screenRatio
                        ),
                      ),
                    ]
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QRCodeView(cardNumber: "KREPM" + profileCard.card,))
                      );
                    },
                    child: Container(
                      color: Colors.white70,
                      width: 49 * screenRatio,
                      height: 49 * screenRatio,
                      padding: EdgeInsets.all(0),
                      child: QrImage(
                        data: "KREPM" + profileCard.card,
                        version: QrVersions.auto,
                        padding: EdgeInsets.all(screenRatio > 1 ? 5 : 1),
                      ),
                    )
                  ),
                ],
              ),
              SizedBox(height: 18,),
              Column(
                children: <Widget>[
                    Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    profileCard.percent + "%", 
                    style: TextStyle(
                      color: Color.fromRGBO(255, 204, 183, 1),
                      fontSize: 13 * screenRatio
                    )
                  ),
                  Text(
                    (int.parse(profileCard.percent) + 1).toString() + "%", 
                    style: TextStyle(
                      color: Color.fromRGBO(255, 204, 183, 1),
                      fontSize: 13 * screenRatio
                    )
                  ),
                ],
              ),
              SizedBox(height: 5,),
              SizedBox(
                height: 4,
                child: LinearProgressIndicator(
                  backgroundColor: Color.fromRGBO(156, 114, 95, 1),
                  value: double.parse(profileCard.sum) / (double.parse(profileCard.sum) + double.parse(profileCard.nextSum)),
                  valueColor: AlwaysStoppedAnimation(Color.fromRGBO(248, 7, 7, 1)),
                ),
              ),
              SizedBox(height: 5,),
              RichText(text: TextSpan(children: [
                TextSpan(
                  text: 'До повышения бонусного уровня осталось набрать на ', 
                  style: TextStyle(color: Color.fromRGBO(249, 241, 10, 0.7), fontSize: 10 * screenRatio)
                ),
                TextSpan(
                  text: profileCard.nextSum + ' ₽',
                  style: TextStyle(color: Color.fromRGBO(249, 241, 10, 1), fontSize: 10 * screenRatio, fontWeight: FontWeight.bold)
                )
              ]))
                ],
              ),
              
            ]
          ),
        )
      ),
    );
  }
}