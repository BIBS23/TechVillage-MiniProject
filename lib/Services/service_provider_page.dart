import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techvillage/screens/profile_screen.dart';
import 'package:techvillage/Utils/contact_tile.dart';

class ServiceProvidersPage extends StatefulWidget {
  final String? profimg;
  final String? servicetitle;
  final String? phone;
  final String? rate;
  final String? exp;
  final String? avail;
  final String collectionRef;

  const ServiceProvidersPage({
  Key? key,
  required this.collectionRef,
  this.servicetitle,
  this.profimg,
  this.phone,
  this.rate,
  this.exp,
  this.avail,
}) : super(key: key);

  @override
  State<ServiceProvidersPage> createState() => _ServiceProvidersPageState();
}

class _ServiceProvidersPageState extends State<ServiceProvidersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
          title: Text(widget.servicetitle.toString(),
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('services')
                .doc(widget.collectionRef)
                .collection('workers')
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CupertinoActivityIndicator());
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No data'));
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        return ContactTile(
                          istrue: true,
                          name: documentSnapshot['workername'],
                          phoneNumber: documentSnapshot['phone'],
                          exp: documentSnapshot['exp'],
                          profimg: documentSnapshot['profimg'],
                          route: ProfilePage(
                            profimg: documentSnapshot['profimg'],
                            name: documentSnapshot['workername'],
                            profile: documentSnapshot['about'],
                            collection1: 'services',
                            collection2: 'workers',
                            document: widget.collectionRef,
                          ),
                        );
                      }),
                );
              }
            }));
  }
}
