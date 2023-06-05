import 'package:flutter/material.dart';
import 'package:techvillage/Utils/feedback_textfield.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController t1controller = TextEditingController();
  TextEditingController t2controller = TextEditingController();

  String feedback = '';
  String suggestion = '';

  void sendEmail() {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'techvillage44@gmail.com',
        query: encodeQueryParameters(<String, String>{
          'subject': 'Feedback And Supprt',
          'body': '$feedback\n\nmy Suggestion\n\n$suggestion',
        }));
    try {
      launchUrl(emailUri);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Feedback',
            style: TextStyle(
                color: Color.fromRGBO(79, 173, 45, 0.612),
                fontWeight: FontWeight.bold)),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,
                color: Color.fromRGBO(79, 173, 45, 0.612))),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
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
              const SizedBox(height: 70),
              const Text('How was your experience:',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              const SizedBox(height: 40),
              FeebackTxtField(
                  hint: 'Type you feedback', controller: t1controller),
              const SizedBox(height: 40),
              const Text('Add Suggestions',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              const SizedBox(height: 40),
              FeebackTxtField(
                  hint: 'Suggestions here', controller: t2controller,
                  ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromRGBO(69, 160, 54, 100).withOpacity(0.9),
                    minimumSize: const Size(110, 40)),
                onPressed: () {
                  setState(() {
                    feedback = t1controller.text;
                    suggestion = t2controller.text;
                  });
                  if (t1controller.text.isNotEmpty &&
                      t2controller.text.isNotEmpty) {
                    sendEmail();
                  }
                  if (t1controller.text == '' && t2controller.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Center(child: Text('Both fields must be filled'))));
                  }
                  if (t1controller.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Center(child: Text('Both fields must be filled'))));
                  }
                  if (t2controller.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Center(child: Text('Both fields must be filled'))));
                  }
                  t2controller.clear();
                  t1controller.clear();
                },
                child: const Text('Submit'),
              ),
              const SizedBox(height: 15),
              Align(
                  alignment: Alignment.bottomRight,
                  child:
                      Image.asset('assets/fdlogo.png', height: 165, width: 165))
            ],
          ),
        ),
      ),
    );
  }
}
