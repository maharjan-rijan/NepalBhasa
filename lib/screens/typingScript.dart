import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:nepal_bhasa/main.dart';
import 'package:screenshot/screenshot.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final contentPadding = screenWidth * 0.03;

    return Scaffold(
      appBar: CustomAppBar(bottomTitle: 'Ranjana Lipi', showBackButton: false),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(contentPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) => setState(() => devanagariInput = value),
              decoration: InputDecoration(
                labelText: 'Type in Devanagari',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
            SizedBox(height: screenHeight * 0.015),
            Row(
              children: [
                const Icon(Icons.text_fields, color: Colors.blue),
                Expanded(
                  child: Slider(
                    min: screenWidth * 0.035,
                    max: screenWidth * 0.15,
                    activeColor: Colors.blue,
                    value: fontSize,
                    divisions: 50,
                    onChanged: (value) => setState(() => fontSize = value),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.015),
            Screenshot(
              controller: screenshotController,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
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
            SizedBox(height: screenHeight * 0.02),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildActionButton(
                  icon: Icons.format_color_text,
                  label: "Text Color",
                  onPressed: () => _pickColor(true),
                ),
                _buildActionButton(
                  icon: Icons.format_color_fill,
                  label: "Background",
                  onPressed: () => _pickColor(false),
                ),
                _buildActionButton(
                  icon: Icons.save,
                  label: "Save",
                  onPressed: _saveImage,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 1),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.blue),
      label: Text(label, style: const TextStyle(color: Colors.blue)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.blue),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }

  void _pickColor(bool isForeground) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              isForeground ? "Select Text Color" : "Select Background Color",
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
              ),
            ),
            actions: [
              TextButton(
                child: const Text("Close"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
    );
  }

  Future<void> _saveImage() async {
    if (!await _requestStoragePermission()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Storage permission denied")),
      );
      return;
    }

    Uint8List? imageBytes = await screenshotController.capture(pixelRatio: 2.0);
    if (imageBytes == null) return;

    final result = await ImageGallerySaverPlus.saveImage(
      imageBytes,
      name: 'ranjana_${DateTime.now().millisecondsSinceEpoch}',
      quality: 100,
    );

    if ((result['isSuccess'] ?? false) || result['filePath'] != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Image saved to gallery")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Failed to save image")));
    }
  }

  Future<bool> _requestStoragePermission() async {
    if (Platform.isAndroid) {
      final status = await Permission.photos.request();
      return status.isGranted;
    } else if (Platform.isIOS) {
      final status = await Permission.photos.request();
      return status.isGranted;
    }
    return false;
  }
}
