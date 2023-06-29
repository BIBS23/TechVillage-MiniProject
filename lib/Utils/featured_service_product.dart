import 'package:flutter/material.dart';
import 'package:techvillage/Services/service_provider_page.dart';
import 'package:techvillage/products/product_sellers_page.dart';

class FeaturedProdService extends StatelessWidget {
  final String iconimage;
  final double bright;
  final double bleft;
  final double btop;
  final double bbottom;
  final String title;
  final String? prodors;

  const FeaturedProdService({
    super.key,
    required this.bbottom,
    required this.bleft,
    required this.bright,
    required this.btop,
    required this.iconimage,
    required this.title,
    this.prodors,
  });

  @override
  Widget build(BuildContext context) {


    
      

    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => prodors == 'Services'
                      ? ServiceProvidersPage(
                        servicetitle: title,
                          collectionRef:
                              title.replaceAll(' ', '').toLowerCase())
                      : SellersPage(
                         prodtitle: title,
                          collectionRef:
                              title.replaceAll(' ', '').toLowerCase())));
        },
        child: Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: bbottom),
              top: BorderSide(width: btop),
              left: BorderSide(width: bleft),
              right: BorderSide(width: bright),
            ),
          ),
          child: Column(
            children: [
              Image(
                  image: NetworkImage(
                    iconimage,
                  ),
                  height: 50,
                  width: 50),
              Text(title),
            ],
          ),
        ));
  }
}
