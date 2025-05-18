import 'package:flutter/material.dart';
import 'package:nepal_bhasa/main.dart';
import 'package:nepal_bhasa/model/script.dart';

// 2. Full consonant list
final List<Number> numbers = [
  Number(char: "१", dev: "१", word: "छि"),
  Number(char: "२", dev: "२", word: "नसि "),
  Number(char: "३", dev: "३", word: "स्वो"),
  Number(char: "४", dev: "४", word: "पि"),
  Number(char: "५", dev: "५", word: "न्या"),
  Number(char: "६", dev: "६", word: "खु"),
  Number(char: "७", dev: "७", word: "न्हस"),
  Number(char: "८", dev: "८", word: "च्या"),
  Number(char: "९", dev: "९", word: "गु"),
  Number(char: "१०", dev: "१०", word: "सान्ह"),
];

// 3. Main consonant page UI
class NumberScreen extends StatelessWidget {
  const NumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(bottomTitle: 'अङ्क / Number / ल्याः'),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: numbers.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 6,
                ),
                itemBuilder: (context, index) {
                  final letter = numbers[index];
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
                              fontSize: 25,
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
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),

                              Text(
                                letter.word,
                                style: TextStyle(
                                  fontSize: 15,
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
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 0),
    );
  }
}
