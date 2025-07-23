int add(String input) {
  final entries = input.split(RegExp(r'[,\s]+')).where((t) => t.isNotEmpty);

  // If the whole string doesn’t match that pattern, it’s invalid
  final numbers = entries.map((t) {
    if (!RegExp(r'^\d+$').hasMatch(t)) {
      throw FormatException('Invalid number: "$t"');
    }
    return int.parse(t);
  });
  final list = numbers.toList();
  if (list.isEmpty) {
    throw FormatException('No numbers to sum.');
  }

  return list.reduce((a, b) => a + b);
}
