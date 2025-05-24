import 'package:flutter/material.dart';
import 'package:nepal_bhasa/main.dart';

class Aboutpage extends StatelessWidget {
  const Aboutpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(bottomTitle: 'About App', showBackButton: true),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const SizedBox(height: 12),
          const Text(
            'Ranjana Lipi (Script) is an app designed and developed by Rijan Maharjan as a learning tool for those who are interested in tradiational Nepalese Script.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),
          const Text(
            'This app provide National Antham of Newa State, basics of Ranjana Script with the ability to type as well. In addition, it provide some information about Nepal Sambat and about National Hero (Sankhadar Shakhwa)',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          PreferredSize(
            preferredSize: const Size.fromHeight(25),
            child: Container(
              color: const Color.fromARGB(255, 255, 234, 50),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Center(
                child: Text(
                  "Development Credit",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Nitya Ranjana Font:\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: 'Tathagata Biswas and Noopur Datye(Ek Type)',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                WidgetSpan(child: Divider()),
                TextSpan(
                  text: 'Reference:\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: 'Ranjana Script by: Thyaka Research Centre',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          PreferredSize(
            preferredSize: const Size.fromHeight(25),
            child: Container(
              color: const Color.fromARGB(255, 255, 234, 50),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Center(
                child: Text(
                  "For suggestion & Feedback",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Contact:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                TextSpan(
                  text: ' +977 - 9866293218\n',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: 'Email:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                TextSpan(
                  text: ' rijanq0@gmail.com\n',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: CustomBottomNavBar(currentIndex: 0),
    );
  }
}
