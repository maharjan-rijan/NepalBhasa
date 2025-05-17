import 'package:flutter/material.dart';
import 'package:nepal_bhasa/main.dart';
import 'package:nepal_bhasa/model/script.dart';

// 2. Full consonant list
final List<Letter> vowels = [
  Letter(char: "अ", dev: "अ", translit: "a"),
  Letter(char: "आ", dev: "आ", translit: "ā"),
  Letter(char: "इ", dev: "इ", translit: "i"),
  Letter(char: "ई", dev: "ई", translit: "ī"),
  Letter(char: "उ", dev: "उ", translit: "u"),
  Letter(char: "ऊ", dev: "ऊ", translit: "ū"),
  Letter(char: "ऋ", dev: "ऋ", translit: "ṛ"),
  Letter(char: "ॠ", dev: "ॠ", translit: "ṝ"),
  Letter(char: "ऌ", dev: "ऌ", translit: "ḷ"),
  Letter(char: "ॡ", dev: "ॡ", translit: "ḹ"),
  Letter(char: "ए", dev: "ए", translit: "e"),
  Letter(char: "ऐ", dev: "ऐ", translit: "ai"),
  Letter(char: "ओ", dev: "ओ", translit: "o"),
  Letter(char: "औ", dev: "औ", translit: "au"),
  Letter(char: "अं", dev: "अं", translit: "aṁ"),
  Letter(char: "अः", dev: "अः", translit: "aḥ"),
];

// 3. Main consonant page UI
class VowelSoundScreen extends StatelessWidget {
  const VowelSoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(bottomTitle: 'स्वर वर्ण / Vowel / मा-आख:'),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: vowels.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final letter = vowels[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            letter.char, // Ranjana placeholder
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Ranjana",
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                letter.dev,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                letter.translit,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
            bottomNavigationBar: CustomBottomNavBar(),

    );
  }
}
