import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nepal_bhasa/main.dart';
import 'package:nepal_bhasa/screens/Other/sankhadharSakwa.dart';

class NepalSambatScreen extends StatelessWidget {
  const NepalSambatScreen({super.key});

  final List<Map<String, String>> months = const [
    {'roman': 'Kachha la', 'devanagari': 'कच्छला', 'nepali': 'कार्तिक/मंसिर'},
    {'roman': 'Thin la', 'devanagari': 'थिंला', 'nepali': 'मंसिर/पुष'},
    {'roman': 'Pohe la', 'devanagari': 'पोहेला', 'nepali': 'पुष/माघ'},
    {'roman': 'Sil la', 'devanagari': 'सिल्ला', 'nepali': 'माघ/फागुन'},
    {'roman': 'Chil la', 'devanagari': 'चिल्ला', 'nepali': 'फागुन/चैत'},
    {'roman': 'Chau la', 'devanagari': 'चौला', 'nepali': 'चैत/बैशाख'},
    {'roman': 'Bachha la', 'devanagari': 'बच्छला', 'nepali': 'बैशाख/जेठ'},
    {'roman': 'Taccha la', 'devanagari': 'तच्छला', 'nepali': 'जेठ/असार'},
    {'roman': 'Dil la', 'devanagari': 'दिल्ला', 'nepali': 'असार/साउन'},
    {'roman': 'Gu la', 'devanagari': 'गुँला', 'nepali': 'साउन/भाद्र'},
    {'roman': 'Yen la', 'devanagari': 'यँला', 'nepali': 'भाद्र/असोज'},
    {'roman': 'Kau la', 'devanagari': 'कोला', 'nepali': 'असोज/कार्तिक'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: CustomAppBar(bottomTitle: 'About Nepal Sambat', showBackButton: true,),
      body: ListView(
        padding: const EdgeInsets.all(13),
        children: [
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: const TextStyle(fontSize: 16, color: Colors.black),
              children: [
                const TextSpan(
                  text:
                      'Nepal Sambat is the official calendar of Nepal. The government of Nepal recognised the Nepal Sambat as the national calendar in 2007 A.D. This calendar was the national calendar of Nepal in Malla and early Shah era too, It was replaced by Bikram Sambat as the national Nepali Calendar latter. However, the calendar is still in use because most of the Nepalese festivals are celebrated according to the nepal sambat calendar. As a result of which most of the Nepalese national newspaper have employed this calendar together with the Gregorian calendar and the Bikram Sambat. Nepal Sambat (नेपाल सम्बत) is a lunar calendar. It was initiated by ',
                ),
                TextSpan(
                  text: 'Sankhadhar Sakhwa',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SankhadharInfoPage(),
                            ),
                          );
                        },
                ),
                const TextSpan(
                  text:
                      ' to commemorate the pay back of all the debts of Nepalese people.',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Months of the year',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            'The months of the year are Once in 3 years there are 13 months in this calendar. The extra month is Analaa',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 12),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(2.5),
            },
            children:
                months.map((month) {
                  return TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          month['devanagari']!,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          month['roman']!,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          month['nepali']!,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  );
                }).toList(),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 0,),
    );
  }
}
