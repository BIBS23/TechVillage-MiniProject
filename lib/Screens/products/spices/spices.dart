import 'package:flutter/material.dart';
import 'package:techvillage/Screens/products/spices/chillipowder.dart';
import 'package:techvillage/Screens/products/spices/ginger.dart';
import 'package:techvillage/Screens/products/spices/turmeric.dart';
import 'package:techvillage/Utils/prod_service_tile.dart';
import 'pepper.dart';

class SpicesPage extends StatelessWidget {
  final List spiceType = [
    'Pepper',
    'Ginger',
    'Turmeric',
    'Red Chilli'
  ];

  final List spiceImg = ['assets/pepper.jpg', 'assets/ginger.jpg','assets/turmeric.jpg','assets/chilli.png'];
  final List spiceTypePage = const  [
    PepperSellersPage(),
    GingerSellersPage(),
    TurmericSellersPage(),
    ChilliSellersPage()
   
  ];

  SpicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        title: const Text('Spices',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: spiceImg.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 120,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return ProdServiceTile(
                title: spiceType[index],
                image: spiceImg[index],
                type: spiceTypePage[index],
              );
            }),
      ),
    );
  }
}
