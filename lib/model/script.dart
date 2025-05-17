class Letter {
  final String char; // Ranjana character (or placeholder)
  final String dev; // Devanagari character
  final String translit; // Transliteration

  Letter({required this.char, required this.dev, required this.translit});
}

class Number {
  final String char;
  final String dev;
  final String word;

  Number({
    required this.char,
    required this.dev,
    required this.word,
  });
}



