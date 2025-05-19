import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:nepal_bhasa/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';

class RanjanaScriptPage extends StatefulWidget {
  const RanjanaScriptPage({super.key});

  @override
  State<RanjanaScriptPage> createState() => _RanjanaScriptPageState();
}

class _RanjanaScriptPageState extends State<RanjanaScriptPage> {
  String devanagariInput = '';
  double fontSize = 32.0;
  Color foregroundColor = Colors.black;
  Color backgroundColor = Colors.grey.shade200;

  final ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(bottomTitle: "Ranjana Script"),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() => devanagariInput = value);
              },
              decoration: InputDecoration(
                labelText: 'Type in Devanagari',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.text_fields,
                  color: Color.fromARGB(255, 133, 174, 228),
                ),
                Expanded(
                  child: Slider(
                    thumbColor: Color.fromARGB(255, 133, 174, 228),
                    activeColor: Color.fromARGB(255, 133, 174, 228),
                    min: 16,
                    max: 72,
                    value: fontSize,
                    onChanged: (value) {
                      setState(() => fontSize = value);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Screenshot(
              controller: screenshotController,
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: Center(
                  child: Text(
                    devanagariInput,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontFamily: 'Ranjana',
                      color: foregroundColor,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Action Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _pickColor(true),
                  icon: const Icon(
                    Icons.format_color_text,
                    color: Color.fromARGB(255, 133, 174, 228),
                  ),
                  label: const Text(
                    "Text Color",
                    style: TextStyle(color: Color.fromARGB(255, 133, 174, 228)),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _pickColor(false),
                  icon: const Icon(
                    Icons.format_color_fill,
                    color: Color.fromARGB(255, 133, 174, 228),
                  ),
                  label: const Text(
                    "Background",
                    style: TextStyle(color: Color.fromARGB(255, 133, 174, 228)),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      showMenu<String>(
                        context: context,
                        position: const RelativeRect.fromLTRB(
                          2000,
                          440,
                          0,
                          0,
                        ), // Adjust as needed
                        items: [
                          const PopupMenuItem<String>(
                            value: 'png',
                            child: Text('PNG'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'jpg',
                            child: Text('JPG'),
                          ),
                        ],
                      ).then((value) {
                        if (value != null) _saveImage(value);
                      });
                    },
                    icon: const Icon(
                      Icons.save,
                      color: Color.fromARGB(255, 133, 174, 228),
                    ),
                    label: const Text(
                      "Save",
                      style: TextStyle(
                        color: Color.fromARGB(255, 133, 174, 228),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 0),
    );
  }

  void _pickColor(bool isForeground) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            isForeground
                ? "Select Foreground Color"
                : "Select Background Color",
          ),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: isForeground ? foregroundColor : backgroundColor,
              onColorChanged: (color) {
                setState(() {
                  if (isForeground) {
                    foregroundColor = color;
                  } else {
                    backgroundColor = color;
                  }
                });
              },
              pickerAreaHeightPercent: 0.5,
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Close"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  Future<void> _saveImage(String format) async {
    if (!(await Permission.storage.request().isGranted)) return;

    Uint8List? bytes = await screenshotController.capture();
    if (bytes == null) return;

    // Save PNG or JPG (SVG not supported in screenshot yet)
    if (format == 'svg') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("SVG export not yet supported.")),
      );
      return;
    }

    final result = await ImageGallerySaverPlus.saveImage(
      bytes,
      quality: 100,
      name: "ranjana_lipi_${DateTime.now().millisecondsSinceEpoch}",
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Saved to gallery as $format")));
  }
}

