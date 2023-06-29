import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:techvillage/Utils/carousel_items.dart';
import 'package:techvillage/Utils/drawer_items.dart';
import 'package:techvillage/Utils/featured_service_product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:techvillage/controller/add_to_fav.dart';
import 'aboutus_screen.dart';
import 'contact_screen.dart.dart';
import 'feedback_screen.dart';
import 'grant_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> drawersPage = const [
    ContactPage(),
    FeedbackPage(),
    AboutUsPage(),
  ];
  String? pad1;
  String? pad2;
  String? pad3;

  int currentIndex = 0;
  bool showLimitMessage = false;
  late String documentId;

  @override
  void initState() {
    super.initState();
    getDocumentIds();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void didChangeMetrics() {
    if (showLimitMessage) {
      setState(() {
        showLimitMessage = false;
      });
    }
  }

  Future<void> getDocumentIds() async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('advertisement');
    DocumentSnapshot ad1 = await collectionRef.doc('ad1').get();
    DocumentSnapshot ad2 = await collectionRef.doc('ad2').get();
    DocumentSnapshot ad3 = await collectionRef.doc('ad3').get();

    setState(() {
      pad1 = ad1.get('ad1');
      pad2 = ad2.get('ad2');
      pad3 = ad3.get('ad3');
    });
  }

  List<Widget> panchayatAds = [];

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String userId = user!.uid.toString();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 22, width: 22),
            const SizedBox(width: 10),
            Text(
              'TechVillage',
              style: GoogleFonts.cookie(
                textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/menu.svg',
              height: 30,
              width: 30,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ),
              );
            },
            icon: SvgPicture.asset('assets/notify.svg'),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(69, 160, 54, 10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: ListView.builder(
          itemCount: drawerItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => drawersPage[index],
                  ),
                ),
                child: ListTile(
                  title: Text(
                    drawerItems[index],
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                height: 130,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              items: carouselItems,
            ),
          ),
          DotsIndicator(
            dotsCount: carouselItems.length,
            position: currentIndex,
            decorator: const DotsDecorator(
              activeColor: Color.fromRGBO(69, 160, 54, 100),
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 15),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('favourites')
                .doc(userId)
                .collection('myfavourites')
                .where('id', isEqualTo: userId)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    child: const Center(child: Text('Add your favourites')),
                  ),
                );
              } else {
                return Consumer<AddToFav>(builder: (context, fav, child) {
                  return SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.docs.length > 6
                          ? 6
                          : snapshot.data!.docs.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        final bool isLastItem =
                            index >= snapshot.data!.docs.length - 4;
                        final bool isFirstItem = index < 3;

                        return GestureDetector(
                          onLongPress: () {
                            // Delete the item from the database
                            fav.deleteItemFromDatabase(
                              documentSnapshot.id,
                              context,
                              false,
                            );
                          },
                          child: FeaturedProdService(
                            bbottom: isLastItem ? 0.01 : 0.3,
                            bleft: isFirstItem ? 0.01 : 0.3,
                            bright: isLastItem ? 0.01 : 0.3,
                            btop: isFirstItem ? 0 : 0.3,
                            iconimage: documentSnapshot['image'],
                            title: documentSnapshot['title'],
                            prodors: documentSnapshot['prodors'],
                          ),
                        );
                      },
                    ),
                  );
                });
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: pad1 != null && pad2 != null && pad3 != null
                ? FutureBuilder<void>(
                    future: getDocumentIds(),
                    builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                      return CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 1,
                          autoPlay: true,
                          height: 120,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                        items: [
                          Image.network(pad1!, fit: BoxFit.cover),
                          Image.network(pad2!, fit: BoxFit.cover),
                          Image.network(pad3!, fit: BoxFit.cover),
                        ],
                      );
                    },
                  )
                : const Center(child: CupertinoActivityIndicator()),
          ),
        ],
      ),
    );
  }
}
