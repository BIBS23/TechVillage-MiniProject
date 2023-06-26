import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('About us',
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
          ],
        )),
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
'''TechVillage is a comprehensive community-centric  platform designed specifically for the residents of this panchayat. Our app aims to revolutionize local buying and selling, while also providing essential services and keeping the community informed about grants and opportunities provided by the panchayat.

1. Local Marketplace:  Explore a wide range of essential products from local vendors right at your fingertips. Discover farm-fresh milk, organic eggs , locally sourced fruits and vegetables and more. Support local farmers and businesses and experience the rich offerings of our panchayat.

2. Services Directory: Easily connect with a variety of service providers within our community. Need a plumber, electrician, carpenter, or cleaner? Find and contact skilled professionals who are dedicated to serving our panchayat. Simplify your life by accessing trusted services right from your smartphone.

3. Grants and Opportunities: Stay updated on the latest grants, subsidies, and initiatives offered by the panchayat. Explore opportunities for personal and business growth, and take advantage of the resources available to you. Never miss out on potential benefits that can enhance your life and contribute to the progress of our community.

In addition to facilitating local commerce and connecting residents with essential services, our app also supports local businesses through targeted advertisements. By showcasing the shops and businesses of our community members, we encourage economic growth and foster a sense of pride in our local enterprises.

Our app is driven by a vision of empowering our local economy, nurturing local talent, and fostering a sense of community pride. We believe in leveraging technology to create meaningful connections and opportunities within our panchayat.

For any inquiries or feedback, please reach out to us .

Thank you for choosing TechVillage and being an integral part of our community-driven platform!''',
                    textAlign: TextAlign.justify, style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
