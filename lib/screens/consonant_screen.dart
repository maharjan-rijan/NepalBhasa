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
  Letter(char: "ज्ञ", dev: "ज्ञ", translit: "gya"),
];

// Define vowel variations
final List<Map<String, String>> vowelMappings = [
  {'symbol': '', 'dev': '', 'translit': 'a'},
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
  {'symbol': 'ः', 'dev': 'ः', 'translit': 'aḥ'},
];

class ConsonantSoundScreen extends StatelessWidget {
  const ConsonantSoundScreen({super.key});

  void _showVowelPopup(BuildContext context, Letter letter) {
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
                    'Consonant with vowel',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children:
                        vowelMappings.map((vowel) {
                          String combined = letter.char + vowel['symbol']!;
                          return Container(
                            width: 65,
                            height: 65,
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
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Ranjana',
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      combined,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      vowel['translit']!,
                                      style: const TextStyle(
                                        fontSize: 15,
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                ),
                itemBuilder: (context, index) {
                  final letter = consonents[index];
                  return GestureDetector(
                    onTap: () => _showVowelPopup(context, letter),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              letter.char,
                              style: const TextStyle(
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
                                  style: const TextStyle(fontSize: 15),
                                ),
                                Text(
                                  letter.translit,
                                  style: const TextStyle(
                                    fontSize: 15,
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
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 1,),
    );
  }
}
