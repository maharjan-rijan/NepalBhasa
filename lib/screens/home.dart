import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nepal_bhasa/screens/Other/aboutPage.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:in_app_review/in_app_review.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:nepal_bhasa/main.dart';

import 'national_anthem.dart';
import 'consonant_screen.dart';
import 'vowel_screen.dart';
import 'number_screen.dart';
import 'login.dart';
import 'otherScreen.dart';
import 'typingScript.dart';
import 'Other/nepalSambat.dart';
import 'Other/sankhadharSakwa.dart';

class HomePage extends StatelessWidget {
  final Color backgroundColor = Color(0xFFC5C0C0);
  final Color tabColor = Colors.grey[700]!;
  final Color buttonBg = Colors.white;

  HomePage({super.key});

  void _logout(BuildContext context) async {
    await signOutUser();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(bottomTitle: 'Ranjana Lipi'),
      drawer: CustomMainDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
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
                    Aboutpage(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 0),
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

  Future<void> _logout(BuildContext context) async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirm Logout'),
            content: const Text('Are you sure you want to log out?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Color.fromARGB(255, 133, 174, 228)),
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text(
                  'Log Out',
                  style: TextStyle(color: Color.fromARGB(255, 133, 174, 228)),
                ),
              ),
            ],
          ),
    );

    if (shouldLogout == true) {
      await FirebaseAuth.instance.signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 206, 200, 200),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 133, 174, 228),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        user?.photoURL != null
                            ? NetworkImage(user!.photoURL!)
                            : const AssetImage('assets/images/sankhadar.png')
                                as ImageProvider,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user?.displayName ?? 'No Name',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    user?.email ?? 'No Email',
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // About Section
            // buildSection(
            //   title: 'About',
            //   isExpanded: isAboutExpanded,
            //   onToggle: () {
            //     setState(() {
            //       isAboutExpanded = !isAboutExpanded;
            //     });
            //   },
            //   children: [
            //     buildMenuItem(title: 'Privacy Policy', icon: Icons.privacy_tip),
            //   ],
            // ),

            // Other Section
            // buildSection(
            //   title: 'Other',
            //   isExpanded: isOtherExpanded,
            //   onToggle: () {
            //     setState(() {
            //       isOtherExpanded = !isOtherExpanded;
            //     });
            //   },
            //   children: [
            //     buildMenuItem(
            //       title: 'Feedback',
            //       icon: Icons.feedback,
            //       onTap: () {
            //         // final Uri emailLaunchUri = Uri(
            //         //   scheme: 'mailto',
            //         //   path: 'rijanq0@email.com',
            //         //   queryParameters: {'subject': 'Feedback on the App'},
            //         // );
            //         // launchUrl(emailLaunchUri);
            //       },
            //     ),
            //     buildMenuItem(title: 'Rate App', icon: Icons.star_rate),
            //     buildMenuItem(
            //       title: 'Share',
            //       icon: Icons.share,
            //       onTap: () {
            //         // ignore: deprecated_member_use
            //         Share.share(
            //           'Check out this awesome app: https://play.google.com/store/apps/details?id=com.example.nepal_bhasa',
            //         );
            //       },
            //     ),
            //   ],
            // ),

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
                  svgPath: 'assets/svgicons/nepa.svg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => NepalSambatScreen()),
                    );
                  },
                ),
                buildMenuItem(
                  title: 'About Sankhadhar Sakhwa',
                  svgPath: 'assets/svgicons/sankha.svg',
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

            // Logout Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 133, 174, 228),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 40),
                ),
                onPressed: () => _logout(context),
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
          icon != null
              ? Icon(icon, size: 20)
              : svgPath != null
              ? SvgPicture.asset(svgPath, width: 30, height: 30)
              : const SizedBox(width: 10),
      title: Text(title),
      onTap: onTap,
    );
  }
}
