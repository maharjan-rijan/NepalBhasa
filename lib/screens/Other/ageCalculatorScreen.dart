import 'package:flutter/material.dart';
import 'package:nepal_bhasa/main.dart';
import 'package:nepali_utils/nepali_utils.dart';

class AgeCalculatePage extends StatefulWidget {
  const AgeCalculatePage({super.key});

  @override
  State<AgeCalculatePage> createState() => _AgeCalculatePageState();
}

class _AgeCalculatePageState extends State<AgeCalculatePage> {
  String selectedConversion = 'AD';

  final List<String> adYears = [
    'Year',
    for (int i = 1990; i <= DateTime.now().year; i++) i.toString(),
  ];

  final List<String> adMonths = [
    'Month',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  final List<String> adDays = [
    'Day',
    for (int i = 1; i <= 31; i++) i.toString(),
  ];

  String selectedAdYear = 'Year';
  String selectedAdMonth = 'Month';
  String selectedAdDay = 'Day';

  final List<String> bsYears = [
    'Year',
    for (int i = 2000; i <= 2090; i++) i.toString(),
  ];
  final List<String> bsMonths = [
    'Month',
    'Baisakh',
    'Jestha',
    'Ashadh',
    'Shrawan',
    'Bhadra',
    'Ashwin',
    'Kartik',
    'Mangsir',
    'Poush',
    'Magh',
    'Falgun',
    'Chaitra',
  ];
  final List<String> bsDays = [
    'Day',
    for (int i = 1; i <= 32; i++) i.toString(),
  ];

  String selectedBsYear = 'Year';
  String selectedBsMonth = 'Month';
  String selectedBsDay = 'Day';

  String ageResult = '00 Years 00 Months 00 Days';

  int monthNameToNumber(String monthName) {
    const map = {
      'January': 1,
      'February': 2,
      'March': 3,
      'April': 4,
      'May': 5,
      'June': 6,
      'July': 7,
      'August': 8,
      'September': 9,
      'October': 10,
      'November': 11,
      'December': 12,
      'Baisakh': 1,
      'Jestha': 2,
      'Ashadh': 3,
      'Shrawan': 4,
      'Bhadra': 5,
      'Ashwin': 6,
      'Kartik': 7,
      'Mangsir': 8,
      'Poush': 9,
      'Magh': 10,
      'Falgun': 11,
      'Chaitra': 12,
    };
    return map[monthName] ?? 1;
  }

  void calculateAge() {
    try {
      DateTime selectedDate;

      if (selectedConversion == 'AD') {
        if (selectedAdYear == 'Year' ||
            selectedAdMonth == 'Month' ||
            selectedAdDay == 'Day') {
          showError('Please select a valid AD date');
          return;
        }

        selectedDate = DateTime(
          int.parse(selectedAdYear),
          monthNameToNumber(selectedAdMonth),
          int.parse(selectedAdDay),
        );
      } else {
        // BS to AD conversion
        if (selectedBsYear == 'Year' ||
            selectedBsMonth == 'Month' ||
            selectedBsDay == 'Day') {
          showError('Please select a valid BS date');
          return;
        }

        final nepaliDate = NepaliDateTime(
          int.parse(selectedBsYear),
          monthNameToNumber(selectedBsMonth),
          int.parse(selectedBsDay),
        );

        selectedDate = nepaliDate.toDateTime(); // Convert to AD
      }

      final now = DateTime.now();
      if (selectedDate.isAfter(now)) {
        showError('Selected date is in the future');
        return;
      }

      final diff = now.difference(selectedDate);
      final ageDate = DateTime(0).add(diff);

      setState(() {
        ageResult =
            '${ageDate.year - 0} Years ${ageDate.month - 1} Months ${ageDate.day - 1} Days';
      });
    } catch (e) {
      showError('Error calculating age: $e');
    }
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: const CustomAppBar(
        bottomTitle: 'Date Converter',
        showBackButton: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Card(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: 'AD',
                        groupValue: selectedConversion,
                        onChanged: (value) {
                          setState(() => selectedConversion = value!);
                        },
                      ),
                      const Text('AD'),
                      const SizedBox(width: 30),
                      Radio<String>(
                        value: 'BS',
                        groupValue: selectedConversion,
                        onChanged: (value) {
                          setState(() => selectedConversion = value!);
                        },
                      ),
                      const Text('BS'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropdownButton<String>(
                        value:
                            selectedConversion == 'AD'
                                ? selectedAdMonth
                                : selectedBsMonth,
                        items:
                            (selectedConversion == 'AD' ? adMonths : bsMonths)
                                .map((String month) {
                                  return DropdownMenuItem<String>(
                                    value: month,
                                    child: Text(month),
                                  );
                                })
                                .toList(),
                        onChanged: (value) {
                          setState(() {
                            if (selectedConversion == 'AD') {
                              selectedAdMonth = value!;
                            } else {
                              selectedBsMonth = value!;
                            }
                          });
                        },
                      ),
                      DropdownButton<String>(
                        value:
                            selectedConversion == 'AD'
                                ? selectedAdDay
                                : selectedBsDay,
                        items:
                            (selectedConversion == 'AD' ? adDays : bsDays).map((
                              String day,
                            ) {
                              return DropdownMenuItem<String>(
                                value: day,
                                child: Text(day),
                              );
                            }).toList(),
                        onChanged: (value) {
                          setState(() {
                            if (selectedConversion == 'AD') {
                              selectedAdDay = value!;
                            } else {
                              selectedBsDay = value!;
                            }
                          });
                        },
                      ),
                      DropdownButton<String>(
                        value:
                            selectedConversion == 'AD'
                                ? selectedAdYear
                                : selectedBsYear,
                        items:
                            (selectedConversion == 'AD' ? adYears : bsYears)
                                .map((String year) {
                                  return DropdownMenuItem<String>(
                                    value: year,
                                    child: Text(year),
                                  );
                                })
                                .toList(),
                        onChanged: (value) {
                          setState(() {
                            if (selectedConversion == 'AD') {
                              selectedAdYear = value!;
                            } else {
                              selectedBsYear = value!;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: calculateAge,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: const Text('Calculate'),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                ageResult,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
