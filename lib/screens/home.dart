import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nepal_bhasa/main.dart';
import 'package:nepal_bhasa/screens/Other/nepalSambat.dart';
import 'package:nepal_bhasa/screens/Other/sankhadharSakwa.dart';
import 'package:nepal_bhasa/screens/otherScreen.dart';
import 'package:nepal_bhasa/screens/typingScript.dart';

import 'national_anthem.dart';
import 'consonant_screen.dart';
import 'vowel_screen.dart';
import 'number_screen.dart';

class HomePage extends StatelessWidget {
  final Color backgroundColor = Color(0xFFC5C0C0);
  final Color tabColor = Colors.grey[700]!;
  final Color buttonBg = Colors.white;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(bottomTitle: 'रञ्जना लिपि'),
      drawer: CustomMainDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: AspectRatio(
                aspectRatio: 1.6,
                child: SvgPicture.asset(
                  'assets/svgicons/newaflag.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 30),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                menuButtonSvg(
                  context,
                  'assets/svgicons/newastate.svg',
                  'National\nAnthem',
                  NationalAnthemPage(),
                ),
                menuButtonSvg(
                  context,
                  'assets/svgicons/vo.svg',
                  'Vowel',
                  VowelSoundScreen(),
                ),
                menuButtonSvg(
                  context,
                  'assets/svgicons/co.svg',
                  'Consonant',
                  ConsonantSoundScreen(),
                ),
                menuButtonSvg(
                  context,
                  'assets/svgicons/nm.svg',
                  'Number',
                  NumberScreen(),
                ),

                menuButtonSvg(
                  context,
                  'assets/svgicons/keyboard.svg',
                  'Typing Script',
                  RanjanaScriptPage(),
                ),
                menuButtonSvg(
                  context,
                  'assets/svgicons/info.svg',
                  'About',
                  Otherscreen(),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }

  Widget menuButtonSvg(
    BuildContext context,
    String assetPath,
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
            SvgPicture.asset(assetPath, height: 40),
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
  bool isPagesExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 206, 200, 200),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 156, 162, 170),
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
                ],
              ),
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
              children: [
                buildMenuItem(title: 'Privacy Policy', icon: Icons.privacy_tip),
              ],
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
                buildMenuItem(title: 'Feedback', icon: Icons.feedback),
                buildMenuItem(title: 'Rate App', icon: Icons.star_rate),
                buildMenuItem(title: 'Share', icon: Icons.share),
              ],
            ),

            // Other Pages Section
            buildSection(
              title: 'Other Pages',
              isExpanded: isPagesExpanded,
              onToggle: () {
                setState(() {
                  isPagesExpanded = !isPagesExpanded;
                });
              },
              children: [
                buildMenuItem(
                  title: 'About Nepal Sambat',
                  svgPath: 'assets/svgicons/nesa.svg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => NepalSambatScreen()),
                    );
                  },
                ),
                buildMenuItem(
                  title: 'About Sankhadhar Sakhwa',
                  svgPath: 'assets/svgicons/nm.svg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SankhadharInfoPage()),
                    );
                  },
                ),
              ],
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 40),
                ),
                onPressed: () {
                  // Add your logout logic here
                },
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

  Widget buildMenuItem({
    required String title,
    IconData? icon,
    String? svgPath,
    VoidCallback? onTap,
  }) {
    return ListTile(
      dense: true,
      leading:
          (icon != null)
              ? Icon(icon, size: 20)
              : (svgPath != null && svgPath.isNotEmpty)
              ? SvgPicture.asset(svgPath, width: 20, height: 20)
              : const SizedBox(width: 20),
      title: Text(title),
      onTap: onTap,
    );
  }
}
