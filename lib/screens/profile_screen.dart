import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  final String profile;
  final String? collection1;
  final String? document;
  final String? collection2;
  final String profimg;
  const ProfilePage({
    super.key,
    required this.name,
    required this.profile,
    this.collection1,
    this.collection2,
    this.document,
    required this.profimg,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void sendEmail() {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    String name = widget.name;

    final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'techvillage44@gmail.com',
        query: encodeQueryParameters(<String, String>{
          'subject': 'Complaint Against $name',
        }));
    try {
      launchUrl(emailUri);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name,
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  textStyle: const TextStyle(letterSpacing: 5))),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(widget.collection1!)
                .doc(widget.document)
                .collection(widget.collection2!)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CupertinoActivityIndicator());
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No data'));
              } else {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.transparent,
                        const Color.fromRGBO(69, 160, 54, 100).withOpacity(0.9)
                      ])),
                  child: Column(
                    children: [
                       CircleAvatar(
                          radius: 60, backgroundImage: CachedNetworkImageProvider(widget.profimg) ),
                      const SizedBox(height: 30),
                      Text(widget.name,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w400)),
                      const SizedBox(height: 40),
                      const Text('About', style: TextStyle(fontSize: 18,letterSpacing: 10)),
                      const SizedBox(height: 25),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                widget.profile,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                              backgroundColor:
                                  const Color.fromRGBO(69, 160, 54, 100),
                              minimumSize: const Size(200, 55),
                              disabledBackgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () async {
                              sendEmail();
                            },
                            child: const Text('Report this profile'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                );
              }
            }),
           
            );
  }
}
