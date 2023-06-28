import 'package:flutter/material.dart';

class GrantTile extends StatelessWidget {
  final exp;
  final grant;
  final category;
  const GrantTile({super.key, this.exp, this.grant, this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 150,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.1,
              blurRadius: 7,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/grant.png', height: 55, width: 55),
                const Text('\t\t\tGrant\nAvailable'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Exp :\t$exp'),
                Container(
                  height: 50,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 0.8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Center(
                      child: Text(
                        grant,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
                Text('category :\t$category'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
