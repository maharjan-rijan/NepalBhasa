import 'package:flutter/material.dart';
import 'package:nepal_bhasa/main.dart';
import 'package:nepali_utils/nepali_utils.dart';

class DateConverterScreen extends StatefulWidget {
  const DateConverterScreen({super.key});

  @override
  State<DateConverterScreen> createState() => _DateConverterScreenState();
}

class _DateConverterScreenState extends State<DateConverterScreen> {
  String selectedConversion = 'AD to BS';
  String selectedMonth = 'Month';
  String selectedDay = 'Day';
  String selectedYear = 'Year';

  String adResult = '';
  String bsResult = '';

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

  final List<String> days = [
    'Day',
    ...List.generate(32, (index) => '${index + 1}'),
  ];
  final List<String> adYears = [
    'Year',
    ...List.generate(100, (i) => '${1950 + i}'),
  ];
  final List<String> bsYears = [
    'Year',
    ...List.generate(100, (i) => '${2000 + i}'),
  ];

  List<String> get months =>
      selectedConversion == 'AD to BS' ? adMonths : bsMonths;
  List<String> get years =>
      selectedConversion == 'AD to BS' ? adYears : bsYears;

  int monthNameToNumber(String monthName) {
    final map = {
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

  String _weekdayName(int weekday) {
    const names = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return names[(weekday - 1) % 7];
  }

  void convertDate() {
    if (selectedYear == 'Year' ||
        selectedMonth == 'Month' ||
        selectedDay == 'Day') {
      showError('Please select a complete date');
      return;
    }

    try {
      int year = int.parse(selectedYear);
      int month = monthNameToNumber(selectedMonth);
      int day = int.parse(selectedDay);

      if (selectedConversion == 'AD to BS') {
        final adDate = DateTime(year, month, day);
        final bsDate = adDate.toNepaliDateTime();

        setState(() {
          adResult =
              '${adDate.year} ${adMonths[adDate.month]} ${adDate.day}, ${_weekdayName(adDate.weekday)}';
          bsResult = NepaliDateFormat.yMMMMEEEEd(
            Language.nepali,
          ).format(bsDate);
        });
      } else {
        final bsDate = NepaliDateTime(year, month, day);
        final adDate = bsDate.toDateTime();

        setState(() {
          bsResult = NepaliDateFormat.yMMMMEEEEd(
            Language.nepali,
          ).format(bsDate);
          adResult =
              '${adDate.year} ${adMonths[adDate.month]} ${adDate.day}, ${_weekdayName(adDate.weekday)}';
        });
      }
    } catch (e) {
      showError('Conversion error: $e');
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
      appBar: CustomAppBar(bottomTitle: 'Date Converter', showBackButton: true),
      body: SingleChildScrollView(
        child: Column(
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
                          value: 'AD to BS',
                          groupValue: selectedConversion,
                          onChanged: (value) {
                            setState(() {
                              selectedConversion = value!;
                              selectedDay = 'Day';
                              selectedMonth = 'Month';
                              selectedYear = 'Year';
                              adResult = '';
                              bsResult = '';
                            });
                          },
                        ),
                        const Text('Convert AD to BS'),
                        const SizedBox(width: 10),
                        Radio<String>(
                          value: 'BS to AD',
                          groupValue: selectedConversion,
                          onChanged: (value) {
                            setState(() {
                              selectedConversion = value!;
                              selectedDay = 'Day';
                              selectedMonth = 'Month';
                              selectedYear = 'Year';
                              adResult = '';
                              bsResult = '';
                            });
                          },
                        ),
                        const Text('Convert BS to AD'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropdownButton<String>(
                          value: selectedMonth,
                          items:
                              months.map((String month) {
                                return DropdownMenuItem<String>(
                                  value: month,
                                  child: Text(month),
                                );
                              }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedMonth = value!;
                            });
                          },
                        ),
                        DropdownButton<String>(
                          value: selectedDay,
                          items:
                              days.map((String day) {
                                return DropdownMenuItem<String>(
                                  value: day,
                                  child: Text(day),
                                );
                              }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedDay = value!;
                            });
                          },
                        ),
                        DropdownButton<String>(
                          value: selectedYear,
                          items:
                              years.map((String year) {
                                return DropdownMenuItem<String>(
                                  value: year,
                                  child: Text(year),
                                );
                              }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedYear = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: convertDate,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Convert',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (adResult.isNotEmpty && bsResult.isNotEmpty)
              Card(
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        selectedConversion == 'AD to BS' ? adResult : bsResult,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        selectedConversion == 'AD to BS' ? bsResult : adResult,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
