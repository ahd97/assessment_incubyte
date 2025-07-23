int add(String input) {
  final pattern = RegExp(r'^\s*\d+\s*(?:,\s*\d+\s*)*$');

  // If the whole string doesn’t match that pattern, it’s invalid
  if (!pattern.hasMatch(input)) {
    throw FormatException(
        'Input may contain only digits, commas, and whitespace,\n'
        'and must not have leading/trailing commas or empty entries.');
  }
  try {
    final numbers = input.split(',').map((e) => int.parse(e.trim())).toList();
    final sum = numbers.reduce((a, b) => a + b);
    return sum;
  } catch (e) {
    print('Invalid input. Please enter only integers separated by commas.');
    return 0;
  }
}
