import 'package:flutter/material.dart';
import 'package:nepal_bhasa/main.dart';
import 'package:nepal_bhasa/model/script.dart';

// List of numbers
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

class NumberScreen extends StatelessWidget {
  const NumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive grid columns
    int crossAxisCount;
    if (screenWidth < 400) {
      crossAxisCount = 3;
    } else if (screenWidth < 600) {
      crossAxisCount = 4;
    } else if (screenWidth < 800) {
      crossAxisCount = 5;
    } else {
      crossAxisCount = 6;
    }

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(bottomTitle: 'अङ्क / Number / ल्याः'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: numbers.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 6,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final letter = numbers[index];
            return Card(
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
                        fontWeight: FontWeight.w500,
                        fontFamily: "Ranjana",
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(letter.dev, style: const TextStyle(fontSize: 15)),
                        Flexible(
                          child: Text(
                            letter.word,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                            ),
                            overflow: TextOverflow.ellipsis,
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
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 0),
    );
  }
}
