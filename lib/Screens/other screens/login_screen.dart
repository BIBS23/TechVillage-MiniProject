import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:techvillage/controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false; // Track the loading state
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  getConnectivity() {
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlertSet == false) {
          showDialogBox();
          setState(() => isAlertSet = true);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthController>(
        builder: (context, signin, child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  const Color.fromRGBO(69, 160, 54, 100).withOpacity(1),
                ],
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
                  child: Text(
                    'Discover local services at your fingertips!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: const Color.fromRGBO(69, 160, 54, 50)
                          .withOpacity(0.8),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/login.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      backgroundColor: const Color.fromRGBO(69, 160, 54, 100),
                      minimumSize: const Size(200, 55),
                      disabledBackgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: _isLoading
                        ? null // Disable the button when loading
                        : () async {
                            setState(() {
                              _isLoading = true; // Set loading state to true
                            });

                            signin.reset();
                            try {
                              await signin.handleGoogleSignIn().then(
                                (value) async {
                                  if (signin.isnull == true) {
                                    // Stay on the login screen
                                    return;
                                  }

                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/signin',
                                    (route) => false,
                                  );
                                },
                              );
                            } catch (e) {
                              print('Unable to sign in');
                            } finally {
                              setState(() {
                                _isLoading =
                                    false; // Set loading state to false
                              });
                            }
                          },
                    icon: _isLoading
                        ? const SizedBox.shrink()
                        : SvgPicture.asset(
                            'assets/google.svg',
                            height: 30,
                            width: 30,
                          ),
                    label: _isLoading
                        ? const SizedBox(
                            width: 30,
                            height: 30,
                            child: CupertinoActivityIndicator(
                              color: Colors.white,
                              radius: 15,
                            ),
                          )
                        : const Text('Login With Google'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  showDialogBox(
  ) => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('No Connection'),
          content: const Text('Please check your internet connectivity'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected && isAlertSet == false) {
                  showDialogBox(
                  );
                  setState(() => isAlertSet = true);
                }
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
}