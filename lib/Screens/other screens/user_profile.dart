import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/login_controller.dart';
import 'help_screen.dart';

class TechVillageProfilePage extends StatelessWidget {
  const TechVillageProfilePage({super.key});


  @override
  Widget build(BuildContext context) {
    void loader() {
      showDialog(
        context: context,
        barrierDismissible:
            false, // Prevent dismissing the dialog by tapping outside
        builder: (context) {
          return const CupertinoActivityIndicator(
            color: Colors.white,
            radius: 15,
          );
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          title:
              Text('Profile', style: GoogleFonts.poppins(color: Colors.black)),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Consumer<AuthController>(
          builder: (context, auth, child) => Container(
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
            child: Column(children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          auth.userProf != null && auth.userProf!.isNotEmpty
                              ? NetworkImage(auth.userProf.toString())
                              : const AssetImage('assets/prof.png')
                                  as ImageProvider),
                ),
              ),
              const SizedBox(height: 60),
              Text(auth.userName.toString()),
              const SizedBox(height: 10),
              Text(auth.mailid.toString()),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HelpScreen()));
                    },
                    child: Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        border: Border(
                          top: BorderSide(
                            width: 0.3,
                            color: Color.fromRGBO(100, 100, 100, 50),
                          ),
                          bottom: BorderSide(
                            width: 0.3,
                            color: Color.fromRGBO(100, 100, 100, 50),
                          ),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 30),
                              Image(
                                image: AssetImage('assets/help.png'),
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(width: 28),
                              Text('Help Center',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Text('Find your answers here',
                              style: TextStyle(fontSize: 14))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    backgroundColor: const Color.fromRGBO(69, 160, 54, 100),
                    minimumSize: const Size(200, 55),
                    disabledBackgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () async {
                    loader();

                    try {
                      Timer(const Duration(seconds: 2), () {
                        auth.handleGoogleSignOut(context);
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text('Sign out'))
            ]),
          ),
        ));
  }
}
