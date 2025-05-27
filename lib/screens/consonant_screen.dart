import 'package:flutter/material.dart';
import 'package:nepal_bhasa/main.dart';
import 'package:nepal_bhasa/model/script.dart';

final List<Letter> consonents = [
  Letter(char: "क", dev: "क", translit: "ka"),
  Letter(char: "ख", dev: "ख", translit: "kha"),
  Letter(char: "ग", dev: "ग", translit: "ga"),
  Letter(char: "घ", dev: "घ", translit: "gha"),
  Letter(char: "ङ", dev: "ङ", translit: "ṅa"),
  Letter(char: "च", dev: "च", translit: "ca"),
  Letter(char: "छ", dev: "छ", translit: "cha"),
  Letter(char: "ज", dev: "ज", translit: "ja"),
  Letter(char: "झ", dev: "झ", translit: "jha"),
  Letter(char: "ञ", dev: "ञ", translit: "ña"),
  Letter(char: "ट", dev: "ट", translit: "ṭa"),
  Letter(char: "ठ", dev: "ठ", translit: "ṭha"),
  Letter(char: "ड", dev: "ड", translit: "ḍa"),
  Letter(char: "ढ", dev: "ढ", translit: "ḍha"),
  Letter(char: "ण", dev: "ण", translit: "ṇa"),
  Letter(char: "त", dev: "त", translit: "ta"),
  Letter(char: "थ", dev: "थ", translit: "tha"),
  Letter(char: "द", dev: "द", translit: "da"),
  Letter(char: "ध", dev: "ध", translit: "dha"),
  Letter(char: "न", dev: "न", translit: "na"),
  Letter(char: "प", dev: "प", translit: "pa"),
  Letter(char: "फ", dev: "फ", translit: "pha"),
  Letter(char: "ब", dev: "ब", translit: "ba"),
  Letter(char: "भ", dev: "भ", translit: "bha"),
  Letter(char: "म", dev: "म", translit: "ma"),
  Letter(char: "य", dev: "य", translit: "ya"),
  Letter(char: "र", dev: "र", translit: "ra"),
  Letter(char: "ल", dev: "ल", translit: "la"),
  Letter(char: "व", dev: "व", translit: "va"),
  Letter(char: "स", dev: "स", translit: "sa"),
  Letter(char: "ष", dev: "ष", translit: "ṣa"),
  Letter(char: "श", dev: "श", translit: "śha"),
  Letter(char: "ह", dev: "ह", translit: "ha"),
  Letter(char: "क्ष", dev: "क्ष", translit: "kṣa"),
  Letter(char: "त्र", dev: "त्र", translit: "tra"),
  Letter(char: "ज्ञ", dev: "ज्ञ", translit: "gya"),];

final List<Map<String, String>> vowelMappings = [{'symbol': '', 'dev': '', 'translit': 'a'},
  {'symbol': 'ा', 'dev': 'ा', 'translit': 'ā'},
  {'symbol': 'ि', 'dev': 'ि', 'translit': 'i'},
  {'symbol': 'ी', 'dev': 'ी', 'translit': 'ī'},
  {'symbol': 'ु', 'dev': 'ु', 'translit': 'u'},
  {'symbol': 'ू', 'dev': 'ू', 'translit': 'ū'},
  {'symbol': 'ृ', 'dev': 'ृ', 'translit': 'ḷ'},
  {'symbol': 'ॄ', 'dev': 'ॄ', 'translit': 'ḹ'},
  {'symbol': 'े', 'dev': 'े', 'translit': 'e'},
  {'symbol': 'ै', 'dev': 'ै', 'translit': 'ai'},
  {'symbol': 'ो', 'dev': 'ो', 'translit': 'o'},
  {'symbol': 'ौ', 'dev': 'ौ', 'translit': 'au'},
  {'symbol': 'ं', 'dev': 'ं', 'translit': 'aṁ'}, // anusvara
  {'symbol': 'ः', 'dev': 'ः', 'translit': 'aḥ'},];

class ConsonantSoundScreen extends StatelessWidget {
  const ConsonantSoundScreen({super.key});

  void _showVowelPopup(BuildContext context, Letter letter) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemSize = screenWidth * 0.2;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 5),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Consonant with Vowel',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: vowelMappings.map((vowel) {
                      String combined = letter.char + vowel['symbol']!;
                      return Container(
                        width: itemSize,
                        height: itemSize,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(color: Colors.black26, blurRadius: 2),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              combined,
                              style: TextStyle(
                                fontSize: itemSize * 0.45,
                                fontFamily: 'Ranjana',
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(combined, style: const TextStyle(fontSize: 14)),
                                Text(
                                  vowel['translit']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;

    if (screenWidth < 400) {
      crossAxisCount = 4;
    } else if (screenWidth < 600) {
      crossAxisCount = 5;
    } else if (screenWidth < 800) {
      crossAxisCount = 6;
    } else {
      crossAxisCount = 7;
    }

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(bottomTitle: 'व्यञ्जन वर्ण / Consonant / बा-आख:'),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: consonents.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemBuilder: (context, index) {
                  final letter = consonents[index];
                  return GestureDetector(
                    onTap: () => _showVowelPopup(context, letter),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              letter.char,
                              style: TextStyle(
                                fontSize: screenWidth * 0.07,
                                fontFamily: "Ranjana",
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(letter.dev, style: const TextStyle(fontSize: 14)),
                                Text(
                                  letter.translit,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 1),
    );
  }
}
