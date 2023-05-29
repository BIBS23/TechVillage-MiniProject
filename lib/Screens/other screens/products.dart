import 'package:flutter/material.dart';
import 'package:techvillage/Screens/products/banana.dart';
import 'package:techvillage/Screens/products/cakes.dart';
import 'package:techvillage/Screens/products/chicken.dart';
import 'package:techvillage/Screens/products/coconut.dart';
import 'package:techvillage/Screens/products/egg.dart';
import 'package:techvillage/Screens/products/milk.dart';
import 'package:techvillage/Screens/products/spices/spices.dart';
import 'package:techvillage/Screens/products/vegetable/vegetables.dart';
import '../../Utils/prod_list.dart';
import '../../Utils/prod_service_tile.dart';
import '../products/fish/fish.dart';
import '../products/pickle/pickle_page.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {

    List serviceType =  [
      const MilkPage(),
      const CoconutPage(),
      const EggPage(),
      PicklePage(),
      FishPage(),
      const ChickenPage(),
      SpicesPage(),
      VegetablesPage(),
      const BananaSellersPage(),
      const CakeSellersPage()
   

    ];
    return Scaffold(
    appBar: AppBar(
        backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        title: const Text('Products',
            style: TextStyle(
                fontSize: 20,
                  fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
          itemCount: prodList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 120,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          crossAxisCount: 2),
          itemBuilder: (context, index) {
            return ProdServiceTile(image: prodList[index],title: prodTitle[index],type: serviceType[index]);
          }),
        )
    );
  }
}
