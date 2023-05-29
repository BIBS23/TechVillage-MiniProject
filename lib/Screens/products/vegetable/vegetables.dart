import 'package:flutter/material.dart';
import 'package:techvillage/Screens/products/vegetable/bittergourd.dart';
import 'package:techvillage/Screens/products/vegetable/ivygourd.dart';
import 'package:techvillage/Screens/products/vegetable/ladiesfinger.dart';
import 'package:techvillage/Screens/products/vegetable/tomato.dart';
import 'package:techvillage/Utils/prod_service_tile.dart';

class VegetablesPage extends StatelessWidget {
  final List vegType = [
    'Ladies Finger',
    'Tomato',
    'BitterGourd',
    'IvyGourd'
  ];

  final List vegImg = ['assets/ladiesfinger.jpg','assets/Tomato.jpg', 'assets/BitterGourd.jpg','assets/IvyGourd.jpg'];
  final List vegTypePage = const  [
    LadiesFingerSellersPage(),
    TomatoSellersPage(),
    BitterGourdSellersPage(),
    IvyGourdSellersPage(),
   
  ];

  VegetablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        title: const Text('Vegetables',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: vegImg.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 120,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return ProdServiceTile(
                title: vegType[index],
                image: vegImg[index],
                type: vegTypePage[index],
              );
            }),
      ),
    );
  }
}
