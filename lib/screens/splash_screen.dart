import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  @override
  void initState() {
    _timer = Timer(const Duration(milliseconds: 980), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
    super.initState();
  }
   @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the state is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logo1.svg',
              height: 182,
              width: 182,
            ),
            const SizedBox(height: 40),
            Text('TechVillage',
                style: GoogleFonts.cookie(
                    textStyle: TextStyle(
                        shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(1, 1),
                        blurRadius: 4,
                      )
                    ],
                        fontSize: 55,
                        color: const Color.fromRGBO(53, 132, 24, 100),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic))),
          ],
        ),
      ),
    );
  }
}
