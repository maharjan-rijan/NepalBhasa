import 'package:flutter/material.dart';
import 'package:nepal_bhasa/main.dart';
import 'package:nepal_bhasa/screens/Other/ageCalculatorScreen.dart';
import 'package:nepal_bhasa/screens/Other/dateConverterScreen.dart';

class Otherscreen extends StatelessWidget {
  final Color backgroundColor = Color(0xFFC5C0C0);
  final Color tabColor = Colors.grey[700]!;
  final Color buttonBg = Colors.white;

  Otherscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(bottomTitle: 'Other'),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.all(10),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  menuButtonIcon(
                    context,
                    Icons.calendar_month_rounded,
                    'Date Converter',
                    DateConverterScreen(),
                  ),
                  menuButtonIcon(
                    context,
                    Icons.calculate_rounded,
                    'Age Calculator',
                    AgeCalculatePage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }

  Widget menuButtonIcon(
    BuildContext context,
    IconData iconData,
    String label,
    Widget targetPage,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => targetPage));
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: buttonBg,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 3)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, size: 50),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget menuButtonText(
    BuildContext context,
    String character,
    String label,
    Widget targetPage,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => targetPage));
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: buttonBg,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 3)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: Text(
                character,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomMainDrawer extends StatefulWidget {
  @override
  _CustomMainDrawerState createState() => _CustomMainDrawerState();
}

class _CustomMainDrawerState extends State<CustomMainDrawer> {
  bool isAboutExpanded = true;
  bool isOtherExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[600],
        child: Column(
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(radius: 50, backgroundColor: Colors.black),
            const SizedBox(height: 10),
            const Text(
              'Name',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const Text(
              'example@gmail.com',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 20),

            // About Section
            buildSection(
              title: 'About',
              isExpanded: isAboutExpanded,
              onToggle: () {
                setState(() {
                  isAboutExpanded = !isAboutExpanded;
                });
              },
              children: [buildMenuItem(Icons.privacy_tip, 'Privacy Policy')],
            ),

            // Other Section
            buildSection(
              title: 'Other',
              isExpanded: isOtherExpanded,
              onToggle: () {
                setState(() {
                  isOtherExpanded = !isOtherExpanded;
                });
              },
              children: [
                buildMenuItem(Icons.feedback, 'Feedback'),
                buildMenuItem(Icons.star_rate, 'Rate App'),
                buildMenuItem(Icons.share, 'Share'),
              ],
            ),

            const Spacer(),
            // Logout Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 40),
                ),
                onPressed: () {},
                child: const Text('Log out'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSection({
    required String title,
    required bool isExpanded,
    required VoidCallback onToggle,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)],
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(title),
            trailing: Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            ),
            onTap: onToggle,
          ),
          if (isExpanded)
            ...children.map(
              (child) => Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: child,
              ),
            ),
        ],
      ),
    );
  }

  Widget buildMenuItem(IconData icon, String title) {
    return ListTile(
      dense: true,
      leading: Icon(icon, size: 20),
      title: Text(title),
      onTap: () {},
    );
  }
}
