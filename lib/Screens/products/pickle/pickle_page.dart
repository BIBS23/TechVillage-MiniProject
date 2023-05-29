import 'package:flutter/material.dart';
import 'package:techvillage/Screens/products/pickle/gooseberry_pickle_sellers.dart';
import 'package:techvillage/Screens/products/pickle/lime_pickle_sellers.dart';
import 'package:techvillage/Screens/products/pickle/mango_pickle_sellers.dart';
import 'package:techvillage/Utils/prod_service_tile.dart';

class PicklePage extends StatelessWidget {
  final List pickleType = [
    'Lime',
    'Mango',
    'Gooseberry'
  ];

  final List pickleImg = ['assets/limepickle.jpg', 'assets/mangopickle.jpg','assets/gooseberry.jpg'];
  final List pickleTypePage = const  [
    LimePickleSellersPage(),
    MangoPickleSellersPage(),
    GooseberryPickleSellersPage()
   
  ];

  PicklePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        title: const Text('Pickles',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: pickleImg.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 120,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return ProdServiceTile(
                title: pickleType[index],
                image: pickleImg[index],
                type: pickleTypePage[index],
              );
            }),
      ),
    );
  }
}
