import 'package:flutter/material.dart';
import 'package:nepal_bhasa/main.dart';

class DateConverterApp extends StatelessWidget {
  const DateConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date Converter',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const DateConverterScreen(),
    );
  }
}

class DateConverterScreen extends StatefulWidget {
  const DateConverterScreen({super.key});

  @override
  State<DateConverterScreen> createState() => _DateConverterScreenState();
}

class _DateConverterScreenState extends State<DateConverterScreen> {
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
      appBar: CustomAppBar(bottomTitle: 'Date Converter', showBackButton: true),
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
                        value: 'AD to BS',
                        groupValue: selectedConversion,
                        onChanged: (value) {
                          setState(() {
                            selectedConversion = value!;

                            
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
                          });
                        },
                      ),
                      const Text('Convert BS to AD'),
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
                    child: const Text('Convert'),
                  ),
                ],
              ),
            ),
          ),
          const Card(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    '2000 Jestha 21, Monday',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '2000 June 21, Monday',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
