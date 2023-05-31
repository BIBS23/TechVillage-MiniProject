import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:techvillage/controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false; // Track the loading state

  bool isAlertSet = false;

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
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 60),
                  child: Text(
                    'Discover, Connect, and Stay Informed: Your Panchayats All-in-One App!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
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
                            final scaffoldMessenger =
                                ScaffoldMessenger.of(context);
                            final navigator = Navigator.of(context);

                            try {
                              final user = await signin.handleGoogleSignIn();
                              if (user != null) {
                                navigator.pushNamedAndRemoveUntil(
                                    '/signin', (route) => false);
                              } else {
                                // User is null, stay on the login screen
                                scaffoldMessenger.showSnackBar(
                                  const SnackBar(
                                    content: Text('Unable to sign in.'),
                                  ),
                                );
                              }
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
}
