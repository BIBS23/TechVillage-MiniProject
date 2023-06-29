import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ContactTile extends StatelessWidget {
  final String phoneNumber;
  final String? name;
  final String? exp;
  final String? profimg;
  final Widget? route;
  final String? avail;
  final bool? istrue;
  final String? rate;

  const ContactTile({
    super.key,
    required this.phoneNumber,
    this.name,
    this.exp,
    this.istrue,
    required this.route,
    this.avail,
    this.profimg,
    this.rate,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> launchPhoneDialer(String phoneNumber) async {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    }

    return Padding(
        padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white70,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                )
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            Row(children: [
              const SizedBox(width: 30),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: CircleAvatar(
                      maxRadius: 28,
                      backgroundImage: CachedNetworkImageProvider(profimg.toString())),
                ),
              ),
              const SizedBox(width: 30),
              Column(
                children: [
                  const SizedBox(height: 15),
                  SizedBox(
                      width: 170,
                      child: Center(
                          child: Text(name.toString(),
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500)))),
                  const SizedBox(height: 5),
                  if (exp != null)
                    Text('Exp : $exp', style: const TextStyle(fontSize: 15)),
                  if (rate != null)
                    Text('Rate : $rate', style: const TextStyle(fontSize: 15)),
                  const SizedBox(height: 5),
                  avail == null
                      ? const SizedBox.shrink()
                      : Text('Availability : $avail',
                          style: const TextStyle(fontSize: 15)),
                  const SizedBox(height: 5),
                ],
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => route!));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(110, 35),
                    ),
                    child: const Text('View Profile')),
                ElevatedButton(
                    onPressed: () {
                      launchPhoneDialer(phoneNumber);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(110, 35),
                    ),
                    child: const Text('Call')),
              ],
            ),
            const SizedBox(height: 20),
          ]),
        ));
  }
}
