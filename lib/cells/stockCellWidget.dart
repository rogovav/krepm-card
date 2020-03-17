import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:krepm_new/models/stock.dart';
import 'package:krepm_new/stockView.dart';
import 'package:http/http.dart' as http;

Widget stockCell({BuildContext context, Stock stock}) {
  double screenRatio = MediaQuery.of(context).size.width / 320;

  Future<void> getData() async {
    var url = 'http://krepm.pro/app-files/stock-price.json';
      var response = await http.post(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${json.decode(response.body)}');
  }

  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: GestureDetector(
      onTap: (){
        getData();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StockView(stock: stock))
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160 * screenRatio,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(stock.img),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 7),
          Text(
            stock.title, 
            style: TextStyle(
              color: Color.fromRGBO(249, 241, 10, .9),
              fontSize: screenRatio > 1 ? 20 : 16,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 5),
          Text(
            stock.description, 
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color.fromRGBO(249, 241, 10, .8),
              fontSize: screenRatio > 1 ? 13 : 12,
              fontWeight: FontWeight.normal
            ),
            textAlign: TextAlign.left,
          ),
        ]
      ),
    ),
  );
}