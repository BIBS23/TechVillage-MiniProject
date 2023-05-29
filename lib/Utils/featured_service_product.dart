import 'package:flutter/material.dart';

class FeaturedProdService extends StatelessWidget {
  final String iconimage;
  final double bright;
  final double bleft;
  final double btop;
  final double bbottom;
  final String title;
  final Widget widget;
  const FeaturedProdService({super.key,
  required this.bbottom,
  required this.bleft,
  required this.bright,
  required this.btop,
  required this.iconimage,
  required this.title,
  required this.widget
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> widget)),
      child: Container(
        height: 90,
        width: 110,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: bbottom),
            top: BorderSide(width: btop),
            left: BorderSide(width: bleft),
            right: BorderSide(width: bright),
          )
        ),
          child: Column(
        children: [Image.asset(iconimage,height: 50,width: 50,),
        Text(title)
        ],
      )),
    );
  }
}
