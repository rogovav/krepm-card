import 'package:flutter/material.dart';
import 'package:krepm_new/models/stock.dart';

Widget stockCell(Stock stock) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              image: NetworkImage(stock.img),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          stock.title, 
          style: TextStyle(
            color: Color.fromRGBO(249, 241, 10, .9),
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 5),
        Text(
          stock.description, 
          style: TextStyle(
            color: Color.fromRGBO(171, 171, 171, .7),
            fontSize: 12,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.left,
        ),
      ]
    ),
  );
}