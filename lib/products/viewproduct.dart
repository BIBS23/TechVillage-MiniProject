import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:techvillage/Utils/gpay_button.dart';
import 'package:techvillage/Utils/mytextfield.dart';
import 'package:lottie/lottie.dart';
import 'package:techvillage/screens/reviewScreen.dart';

class ViewProductScreen extends StatefulWidget {
  final String? prodimg;
  final String? prodname;
  final String? proddetails;
  final String? sellerinfo;
  final String? rate;
  final String? docid;

  const ViewProductScreen({
    Key? key,
    this.prodimg,
    this.prodname,
    this.proddetails,
    this.sellerinfo,
    this.rate,
    this.docid,
  }) : super(key: key);

  @override
  State<ViewProductScreen> createState() => _ViewProductScreenState();
}

class _ViewProductScreenState extends State<ViewProductScreen> {
  String? name;
  String photoUrl = '';
  final TextEditingController reviewController = TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

  late Future<void> _userProfileFuture;

  @override
  void initState() {
    super.initState();
    _userProfileFuture = fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    // Simulating an asynchronous API call to fetch the user profile
    await Future.delayed(const Duration(seconds: 1));

    // Set the user profile data
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    setState(() {
      name = googleUser!.displayName;
      photoUrl = googleUser.photoUrl ?? '';

      // Check if the profile picture is available
      if (googleUser.photoUrl != null) {
        photoUrl = googleUser.photoUrl!.replaceAll("s96-c", "s192-c");
      } else {
        photoUrl =
            ''; // Set an empty string if profile picture is not available
      }
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<void>(
          future: _userProfileFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Lottie.network(
                      'https://assets3.lottiefiles.com/packages/lf20_tbrwjiv5.json',
                      width: 130,
                      height: 130));
            }

            return Stack(
              children: [
                Image.network(widget.prodimg.toString()),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                DraggableScrollableSheet(
                  maxChildSize: 1,
                  initialChildSize: 0.6,
                  minChildSize: 0.6,
                  builder: (context, scrollController) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Container(
                                  width: 80,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Center(
                                child: Text(
                                  widget.prodname.toString(),
                                  style: const TextStyle(
                                    fontSize: 30,
                                    letterSpacing: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                children: [
                                   const Text('Price :',
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  const SizedBox(width: 10),
                                  Text('₹ ${widget.rate}',
                                    style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              const Text(
                                'Product Details',
                                style:
                                    TextStyle(fontSize: 20, letterSpacing: 2),
                              ),
                              const SizedBox(height: 18),
                              Text(
                                widget.proddetails.toString(),
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  fontSize: 15,
                              
                                ),
                              ),
                              const SizedBox(height: 30),
                              const Text(
                                'Sellers Info',
                                style:
                                    TextStyle(fontSize: 20, letterSpacing: 2),
                              ),
                              const SizedBox(height: 18),
                              Text(
                                widget.sellerinfo.toString(),
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  fontSize: 15,
                                  
                                ),
                              ),
                              const SizedBox(height: 18),
                              Row(
                                children: [
                                  const Text(
                                    'Product Review',
                                    style: TextStyle(
                                      fontSize: 20,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Column(
                                            children: [
                                              const SizedBox(height: 30),
                                              const Text(
                                                'Add your review',
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  letterSpacing: 2,
                                                ),
                                              ),
                                              const SizedBox(height: 30),
                                              TxtField(
                                                mycontroller: reviewController,
                                                type: TextInputType.multiline,
                                                mylabel: 'Add your Review',
                                                maxlines: 5,
                                              ),
                                              const SizedBox(height: 18),
                                              Center(
                                                child: ElevatedButton.icon(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    splashFactory:
                                                        NoSplash.splashFactory,
                                                    backgroundColor:
                                                        const Color.fromRGBO(
                                                            69, 160, 54, 100),
                                                    minimumSize:
                                                        const Size(200, 55),
                                                    disabledBackgroundColor:
                                                        Colors.transparent,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                  ),
                                                  icon: const Icon(Icons.add),
                                                  label: const Text(
                                                    'Add Review',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      letterSpacing: 2,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    CollectionReference
                                                        collectionRef =
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'products');
                                                    DateTime now =
                                                        DateTime.now();
                                                    String d =
                                                        now.day.toString();
                                                    String m =
                                                        now.month.toString();
                                                    String y =
                                                        now.year.toString();

                                                    collectionRef
                                                        .doc(widget.docid)
                                                        .collection('reviews')
                                                        .add({
                                                      'username': name,
                                                      'userprof':photoUrl,
                                                      'firstletter': name![0],

                                                      'review':
                                                          reviewController.text,
                                                      'date': '$d' '-$m-' '$y',
                                                      'timestamp':
                                                          now.toString(),
                                                    }).then((value) {
                                                      reviewController.clear();
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                ],
                              ),

                              ReviewGrid(docid: widget.docid.toString()),
                             
                              const SizedBox(height: 30),
                              const Center(child: GpayButton()),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
