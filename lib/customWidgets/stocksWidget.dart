import 'package:flutter/material.dart';
import 'package:krepm_new/cells/stockCellWidget.dart';
import 'package:krepm_new/models/stock.dart';

class StocksWidget extends StatelessWidget {

  final List<Stock> stocks = <Stock>[
    Stock(
      img: 'https://picsum.photos/250?image=7', 
      title: "Акция 1", 
      description: "Lorem ipsum – псевдо-латинский текст, который используется для веб дизайна, типографии, оборудования, и распечатки."
    ), 
    Stock(
      img: 'https://picsum.photos/250?image=45', 
      title: "Акция 2", 
      description: "Lorem ipsum по большей части является элементом латинского текста классического автора и философа Цицерона."
    ), 
    Stock(
      img: 'https://picsum.photos/250?image=32', 
      title: "Новость 1", 
      description: "Lorem ipsum – псевдо-латинский текст."
    ), 
    Stock(
      img: 'https://picsum.photos/250?image=16', 
      title: "Акция 3", 
      description: "Хотя Lorem ipsum напоминает классический латинский."
    ), 
    Stock(
      img: 'https://picsum.photos/250?image=34', 
      title: "Новость 2", 
      description: "Lorem ipsum – псевдо-латинский текст, который используется для веб дизайна, типографии, оборудования, и распечатки"
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 5),
        itemCount: stocks.length,
        itemBuilder: (context, i) {
          return stockCell(stocks[i]);
        }
      )
    );
  }
}