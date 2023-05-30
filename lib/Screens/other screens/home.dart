import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techvillage/Screens/Services/electrician.dart';
import 'package:techvillage/Screens/Services/plumber.dart';
import 'package:techvillage/Screens/Services/tailor.dart';
import 'package:techvillage/Screens/products/coconut.dart';
import 'package:techvillage/Screens/products/egg.dart';
import 'package:techvillage/Screens/products/milk.dart';
import 'package:techvillage/Utils/carousel_items.dart';
import 'package:techvillage/Utils/drawer_items.dart';
import 'package:techvillage/Utils/featured_service_product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'aboutus_screen.dart';
import 'contact_screen.dart.dart';
import 'feedback_screen.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List drawersPage = const [
    ContactPage(),
    FeedbackPage(),
    AboutUsPage(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        title: Text('TechVillage',
            style: GoogleFonts.cookie(
                textStyle: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic))),
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
                    builder: (context) => const NotificationPage()));
              },
              icon: SvgPicture.asset('assets/notify.svg'))
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(69, 160, 54, 10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        child: ListView.builder(
            itemCount: drawerItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => drawersPage[index])),
                  child: ListTile(
                    title: Text(drawerItems[index],
                        style: TextStyle(color: Colors.white.withOpacity(0.8))),
                  ),
                ),
              );
            }),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
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
                color: Colors.grey),
          ),
          const SizedBox(height: 25),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FeaturedProdService(
                  bbottom: 0.3,
                  bleft: 0,
                  bright: 0.3,
                  btop: 0,
                  iconimage: 'assets/f1.png',
                  title: 'Coconut',
                  widget: CoconutPage(),
                  ),
              FeaturedProdService(
                  bbottom: 0.3,
                  bleft: 0,
                  bright: 0.3,
                  btop: 0,
                  iconimage: 'assets/f2.png',
                  title: 'Milk',
                  widget: MilkPage(),
                  ),
              FeaturedProdService(
                  bbottom: 0.3,
                  bleft: 0,
                  bright: 0,
                  btop: 0,
                  iconimage: 'assets/f3.png',
                  title: "Egg",
                  widget: EggPage(),
                  ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FeaturedProdService(
                  bbottom: 0,
                  bleft: 0,
                  bright: 0.3,
                  btop: 0,
                  iconimage: 'assets/f4.png',
                  title: "Electrician",
                  widget: ElectricianPage(),
                  ),
              FeaturedProdService(
                  bbottom: 0,
                  bleft: 0,
                  bright: 0.3,
                  btop: 0,
                  iconimage: 'assets/f5.png',
                  title: "Plumber",
                  widget: PlumberPage(),
                  ),
              FeaturedProdService(
                  bbottom: 0.01,
                  bleft: 0,
                  bright: 0,
                  btop: 0,
                  iconimage: 'assets/f6.png',
                  title: "Tailor",
                  widget: TailorPage(),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
