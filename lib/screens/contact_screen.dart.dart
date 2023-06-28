import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techvillage/Utils/socialmedia_icon.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Contact us',
          style: TextStyle(color: Color.fromRGBO(79, 173, 45, 0.612),fontWeight: FontWeight.bold)),
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back,
                  color: Color.fromRGBO(79, 173, 45, 0.612))),
        ),
        body: Container(
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
              const SizedBox(height: 30),
              SvgPicture.asset('assets/logo1.svg',height: 70,width: 70),
              const SizedBox(height: 30),
              Text('TechVillage',style: GoogleFonts.cookie(fontSize: 47,color: const Color.fromRGBO(53, 132, 24, 100))),
              const SizedBox(height: 50),
              const  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialMediaIcon(myurlscheme: 'instagram://user?username=', myusername: 'techvillage44', iconimg: 'assets/insta.png',webUrl: 'https://www.instagram.com/',),
                  SocialMediaIcon(myurlscheme: 'twitter://user?username=', myusername: 'techvillage44', iconimg: 'assets/twitter.png',webUrl: 'https://twitter.com/',),
                  SocialMediaIcon(myurlscheme: 'mailto:', myusername: 'techvillage44@gmail.com', iconimg: 'assets/gmail.png',webUrl: 'mailto:',),
                ]
              ),
              const SizedBox(height: 90),
              Image.asset('assets/customer.png',height: 238,width: 238),
        
            ],
          ),
        ));
  }
}
