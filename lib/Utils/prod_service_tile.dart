import 'package:flutter/material.dart';

class ProdServiceTile extends StatelessWidget {
  final String image;
  final String title;
  final type;
  const ProdServiceTile(
      {super.key,
      required this.title,
      required this.image,
      this.type});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
        context, MaterialPageRoute(builder: (context) => type));
      },
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.1,
                blurRadius: 7,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(image, fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6, top: 6),
                child: Text(title),
              ),
            ],
          )),
    );
  }
}
