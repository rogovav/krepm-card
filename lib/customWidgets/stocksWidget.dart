import 'package:flutter/material.dart';
import 'package:krepm_new/cells/stockCellWidget.dart';
import 'package:krepm_new/models/stock.dart';
import 'package:http/http.dart' as http;

class StocksWidget extends StatelessWidget {

  final List<Stock> stocks = <Stock>[
    Stock(
      img: 'http://krepm.pro/app-files/stock-price.jpg', 
      title: "Ликвидация остатков", 
      description: "Сеть магазинов «Креп.М» объявляет о ликвидации товаров! Освобождаем полки для нового ассортимента товаров! Основные предложения ждут непосредственно на полках, поэтому спешите в ближайший магазин «Креп.М» за невероятной выгодой!\nКоличество товара ограничено."
    ),
    Stock(
      img: 'http://krepm.pro/app-files/garant-price.jpg', 
      title: "Гарантия лучшей цены", 
      description: "Lorem ipsum – псевдо-латинский текст, который используется для веб дизайна, типографии, оборудования, и распечатки."
    ), 
    Stock(
      img: 'http://krepm.pro/app-files/gift-certificate.jpg', 
      title: "Подарочные сертификаты", 
      description: "Lorem ipsum – псевдо-латинский текст."
    ), 
    Stock(
      img: 'http://krepm.pro/app-files/free-shiping.jpg', 
      title: "Бесплатная доставка", 
      description: "Хотя Lorem ipsum напоминает классический латинский."
    ), 
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: stocks.length,
        itemBuilder: (context, i) {
          return stockCell(stock: stocks[i], context: context);
        }
      )
    );
  }
}