import 'package:flutter/material.dart';
import 'package:techvillage/Screens/products/fish/catla.dart';
import 'package:techvillage/Screens/products/fish/mushi.dart';
import 'package:techvillage/Screens/products/fish/rohu.dart';
import 'package:techvillage/Screens/products/fish/thilopia.dart';
import 'package:techvillage/Utils/prod_service_tile.dart';

class FishPage extends StatelessWidget {
  final List spiceType = [
    'Mushi',
    'Thilopia',
    'Catla',
    'Rohu'
  ];

  final List fishImg = ['assets/mushi.jpg', 'assets/thilopia.jpg','assets/catla.jpg','assets/rohu.jpg'];
  final List fishTypePage = const  [

    {
        'widget':  MushiPage(),
        'fav': false,

      },
     
      {
        'widget': ThilopiaPage(),
        'fav': false,

      },
       {
        'widget': CatlaPage(),
        'fav': false,

      },
      {
        'widget':  RohuPage(),
        'fav': false,

      }
   
   
  ];

  FishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        title: const Text('Fish',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: fishImg.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 120,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return ProdServiceTile(
                title: spiceType[index],
                image: fishImg[index],
                type: fishTypePage[index]['widget'],
                fav: fishTypePage[index]['fav'],
              );
            }),
      ),
    );
  }
}
