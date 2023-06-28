import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center', style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
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
        child: Padding(
          padding:  const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: InteractiveViewer(
              panAxis: PanAxis.free,
              maxScale: 2.5,
              minScale: 0.8,
              child: const Column(
                children: [
                  Text('How can I improve my small scale bussiness through the app?',style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('We Provide this platform to organise and communicate your small scale bussiness to the people in our locality and you can improve it by providing your details and the admin will share the details to the needed persons who wish to collaborate with your business',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  Text('How can I find and contact local service providers through this app?',style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('This app will help you to find local service providers by browsing the contact page or directly contact the person.',textAlign: TextAlign.justify,style: TextStyle(fontSize: 15)),
                      SizedBox(height: 10),
                  Text('How can I create a user profile in panchayat custom application?',style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('First download this app and then sign up to this app by providing your credentials that are necessary in sign up',textAlign: TextAlign.justify,style: TextStyle(fontSize: 15)),
                  SizedBox(height: 10),
                  Text('How can the app help me in finding job opportunities in panchayat?',style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('Connect with the admin (panchayat official ) to provide appropriate job opportunities in our locality',textAlign: TextAlign.justify,style: TextStyle(fontSize: 15)),
                  SizedBox(height: 10),
                  Text('How can I search for and purchase goods through the app?',style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('You can purchase goods by browsing to product page and select the products and contact the seller from contact page.',textAlign: TextAlign.justify,style: TextStyle(fontSize: 15)),
                  SizedBox(height: 10),
                  Text('What type of services are provided through this app ?',style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('The services that we provide are mentioned in the home page itself you can check it and avail the service you require',textAlign: TextAlign.justify,style: TextStyle(fontSize: 15)),
                  SizedBox(height: 10),
                  Text('How can I access information about government grants through this app?',style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('How can I access information about government grants through this app?',textAlign: TextAlign.justify,style: TextStyle(fontSize: 15)),
                  SizedBox(height: 10),
                  Text('How can I provide feedback to improve your application?',style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('You can provide feedback on the feedback , review coloumn provided',textAlign: TextAlign.justify,style: TextStyle(fontSize: 15)),
                  SizedBox(height: 10),
                  Text('How can I report issues or problems with the app to  customer support?',style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('By contacting directly the admin of this app.\t\t\t\t\t\t\t\t\t',textAlign: TextAlign.justify,style: TextStyle(fontSize: 15)),
                  SizedBox(height: 10),
                  Text('Is there a feature on the app that allows me to book appointments with local service providers such as doctors,hairdressers etc?',style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('There is no time slot for this app but the convenient working time of all the service providers are given so you can contact them and book your appointments before hand',textAlign: TextAlign.justify,style: TextStyle(fontSize: 15)),
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
