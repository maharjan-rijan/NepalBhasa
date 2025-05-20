import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:nepal_bhasa/screens/Other/ageCalculatorScreen.dart';
import 'package:nepal_bhasa/screens/consonant_screen.dart';
import 'package:nepal_bhasa/screens/home.dart';
import 'package:nepal_bhasa/screens/login.dart';
import 'package:nepal_bhasa/screens/national_anthem.dart';
import 'package:nepal_bhasa/screens/number_screen.dart';
import 'package:nepal_bhasa/screens/otherScreen.dart';
import 'package:nepal_bhasa/screens/typingScript.dart';
import 'package:nepal_bhasa/screens/vowel_screen.dart';
import 'package:nepali_utils/nepali_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      title: "Nepal Bhasa",
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String bottomTitle;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.bottomTitle,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final englishDate = DateFormat.yMMMMEEEEd().format(now);
    final nepaliDate = now.toNepaliDateTime();
    final nepaliDateStr = NepaliDateFormat.yMMMMEEEEd(
      Language.nepali,
    ).format(nepaliDate);

    return AppBar(
      automaticallyImplyLeading: false,
      leading:
          showBackButton
              ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              )
              : Builder(
                builder:
                    (context) => IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
              ),
      backgroundColor: const Color.fromARGB(255, 133, 174, 228),
      centerTitle: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nepaliDateStr,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            englishDate,
            style: const TextStyle(color: Colors.black87, fontSize: 12),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(25),
        child: Container(
          color: const Color.fromARGB(255, 255, 234, 50),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Center(
            child: Text(
              bottomTitle,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(85);
}

class CustomDrawer extends StatelessWidget implements PreferredSizeWidget {
  const CustomDrawer({super.key});

  @override
  Size get preferredSize => const Size.fromWidth(20.0);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[300],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 133, 174, 228),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset("assets/svgicons/logo.svg", height: 90),
                  Text(
                    'Ranjana Lipi',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              context,
              svgPath: '',
              icon: Icons.home,
              title: 'Home',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => HomePage()),
                );
              },
            ),
            _buildDrawerItem(
              context,
              svgPath: 'assets/svgicons/newastate.svg',
              title: 'National Anthem',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => NationalAnthemPage()),
                );
              },
            ),
            _buildDrawerItem(
              context,
              svgPath: 'assets/svgicons/co.svg',
              title: 'Consonant',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ConsonantSoundScreen()),
                );
              },
            ),
            _buildDrawerItem(
              context,
              svgPath: 'assets/svgicons/vo.svg',
              title: 'Vowel',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => VowelSoundScreen()),
                );
              },
            ),
            _buildDrawerItem(
              context,
              svgPath: 'assets/svgicons/nm.svg',
              title: 'Number',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => NumberScreen()),
                );
              },
            ),
            _buildDrawerItem(
              context,
              svgPath: '',
              icon: Icons.keyboard_hide,
              title: 'Typing Script',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RanjanaScriptPage()),
                );
              },
            ),
            Divider(),
            _buildDrawerItem(
              context,
              svgPath: '',
              icon: Icons.info_outline,
              title: 'About',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => HomePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    IconData? icon,
    String? svgPath,
    String? title,
    VoidCallback? onTap,
    Color iconColor = Colors.black,
  }) {
    return ListTile(
      leading:
          icon != null
              ? Icon(icon, color: iconColor)
              : (svgPath != null && svgPath.isNotEmpty
                  ? SvgPicture.asset(svgPath, height: 24, width: 24)
                  : const SizedBox(width: 24)),
      title: Text(
        title ?? '',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onTap: onTap,
    );
  }
}

class IconTile extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback? onTap;

  const IconTile({
    super.key,
    required this.iconPath,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              height: 40,
              placeholderBuilder: (_) => const Icon(Icons.image),
            ),
            const SizedBox(height: 8),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Otherscreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Color.fromARGB(255, 133, 174, 228)),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.more_horiz_rounded,
            color: Color.fromARGB(255, 133, 174, 228),
          ),
          label: "Other",
        ),
      ],
    );
  }
}

Future<void> signOutUser() async {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  try {
    await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  } catch (e) {
    print("Logout failed: $e");
  }
}