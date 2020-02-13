import 'package:flutter/material.dart';

Widget logoWidget() {
  return Column(
    children: [
      Image(image: AssetImage('assets/img/logo.png')),
      SizedBox(height: 10,),
      Image(image: AssetImage('assets/img/logo_bottom.png'))
    ]
  );
}