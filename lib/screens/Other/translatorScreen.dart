import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:nepal_bhasa/main.dart';
import 'package:translator/translator.dart';

class TranslatorScreen extends StatefulWidget {
  @override
  _TranslatorScreenState createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  final sourceController = TextEditingController();
  final translatedController = TextEditingController();

  String sourceLang = 'en';
  String targetLang = 'ne';

  final FlutterTts flutterTts = FlutterTts();
  final translator = GoogleTranslator();
  Timer? _debounce;

  final languageMap = {
    'English': 'en',
    'Nepali': 'ne',
    'French': 'fr',
    'German': 'de',
  };

  @override
  void initState() {
    super.initState();
    sourceController.addListener(_onTyping);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    sourceController.dispose();
    translatedController.dispose();
    super.dispose();
  }

  void _onTyping() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (sourceController.text.isNotEmpty) {
        translateText();
      } else {
        setState(() => translatedController.text = '');
      }
    });
  }

  Future<void> translateText() async {
    try {
      final text = sourceController.text;
      if (text.isEmpty) return;
      final translation = await translator.translate(
        text,
        from: sourceLang,
        to: targetLang,
      );
      setState(() {
        translatedController.text = translation.text;
      });
    } catch (e) {
      setState(() {
        translatedController.text = 'Translation error.';
      });
    }
  }

  Future<void> speak(String text, String lang) async {
    await flutterTts.setLanguage(lang);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Copied to clipboard")));
  }

  void switchLanguages() {
    setState(() {
      final temp = sourceLang;
      sourceLang = targetLang;
      targetLang = temp;
      final tempText = sourceController.text;
      sourceController.text = translatedController.text;
      translatedController.text = tempText;
    });
    translateText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(bottomTitle: "Translator", showBackButton: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value:
                        languageMap.entries
                            .firstWhere((e) => e.value == sourceLang)
                            .key,
                    isExpanded: true,
                    items:
                        languageMap.keys
                            .map(
                              (lang) => DropdownMenuItem(
                                value: lang,
                                child: Text(lang),
                              ),
                            )
                            .toList(),
                    onChanged: (value) {
                      setState(() {
                        sourceLang = languageMap[value]!;
                      });
                      translateText();
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.swap_horiz),
                  onPressed: switchLanguages,
                  tooltip: 'Switch Languages',
                ),
                Expanded(
                  child: DropdownButton<String>(
                    value:
                        languageMap.entries
                            .firstWhere((e) => e.value == targetLang)
                            .key,
                    isExpanded: true,
                    items:
                        languageMap.keys
                            .map(
                              (lang) => DropdownMenuItem(
                                value: lang,
                                child: Text(lang),
                              ),
                            )
                            .toList(),
                    onChanged: (value) {
                      setState(() {
                        targetLang = languageMap[value]!;
                      });
                      translateText();
                    },
                  ),
                ),
              ],
            ),
          ),
          _buildTextBox(sourceController, language: sourceLang),
          SizedBox(height: 10),
          _buildTextBox(
            translatedController,
            language: targetLang,
            enabled: false,
          ),
        ],
      ),
      bottomNavigationBar:CustomBottomNavBar(currentIndex: 1),
    );
  }

  Widget _buildTextBox(
    TextEditingController controller, {
    bool enabled = true,
    required String language,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        height: 120,
        child: Stack(
          children: [
            TextField(
              controller: controller,
              enabled: enabled,
              maxLines: null,
              decoration: InputDecoration.collapsed(
                hintText: enabled ? 'Enter text' : 'Translation',
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: () => copyToClipboard(controller.text),
                  ),
                  IconButton(
                    icon: Icon(Icons.volume_up),
                    onPressed: () => speak(controller.text, language),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
