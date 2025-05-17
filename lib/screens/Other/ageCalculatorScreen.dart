import 'package:flutter/material.dart';
import 'package:nepal_bhasa/main.dart';

class AgeCalculatePage extends StatefulWidget {
  const AgeCalculatePage({super.key});

  @override
  State<AgeCalculatePage> createState() => _AgeCalculatePageState();
}

class _AgeCalculatePageState extends State<AgeCalculatePage> {
  String selectedConversion = 'AD to BS';
  String selectedMonth = 'Months';
  String selectedDay = 'Day';
  String selectedYear = 'Year';

  final List<String> months = ['Months', 'Baisakh', 'Jestha', 'Ashadh'];
  final List<String> days = ['Day', '1', '2', '3', '21'];
  final List<String> years = ['Year', '1999', '2000', '2001'];

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
                          setState(() {
                            selectedConversion = value!;
                          });
                        },
                      ),
                      const Text('AD'),
                      const SizedBox(width: 30),
                      Radio<String>(
                        value: 'BS',
                        groupValue: selectedConversion,
                        onChanged: (value) {
                          setState(() {
                            selectedConversion = value!;
                          });
                        },
                      ),
                      const Text('BS'),
                    ],
                  ),
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
                    onPressed: () {
                      // Convert logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: const Text('Calculate'),
                  ),
                ],
              ),
            ),
          ),
          const Card(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '00 Years 00 Months 00 Days',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
