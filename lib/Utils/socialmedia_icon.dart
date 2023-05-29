import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcon extends StatelessWidget {
  final String myusername;
  final String myurlscheme;
  final String iconimg;
  final String webUrl;

  const SocialMediaIcon({
    Key? key,
    required this.myurlscheme,
    required this.myusername,
    required this.iconimg,
    required this.webUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void openAppWithUsername(String username, String urlscheme,String weburl) async {
      if (await canLaunch('$myurlscheme' + '$myusername')) {
        await launch('$myurlscheme' + '$myusername');
      } else {
        // Fallback to opening the Twitter website if the app is not installed
        await launch(webUrl + '$myusername');
      }
    }

    return GestureDetector(
      onTap: () => openAppWithUsername(myusername, myurlscheme,webUrl),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(iconimg)),
        ),
      ),
    );
  }
}
