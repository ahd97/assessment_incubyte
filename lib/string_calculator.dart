int add(String input) {
  if (input.isEmpty) {
    throw FormatException('Input cannot be empty.');
  }

  String body = input;
  String? customDelimiter;

  // Detect custom delimiter declaration
  if (body.startsWith('//')) {
    final newlineIndex = body.indexOf('\n');
    if (newlineIndex < 0) {
      throw FormatException(
          'Missing newline after custom delimiter declaration.');
    }
    final delim = body.substring(2, newlineIndex);
    if (delim.length != 1 || RegExp(r'[A-Za-z0-9]').hasMatch(delim)) {
      throw FormatException(
          'Custom delimiter must be a single special character.');
    }
    customDelimiter = delim;
    // Remove the delimiter declaration header
    body = body.substring(newlineIndex + 1);
  }

  // Tokenize based on custom or default delimiters
  List<String> tokens;
  if (customDelimiter != null) {
    // Split on custom delimiter or newline
    tokens = body.multiSplit([',', '\n', customDelimiter]);
  } else {
    // Default: split on commas or any whitespace/newline
    tokens = body.split(RegExp(r'[,\s]+'));
  }

  // Trim and filter out empty tokens
  final values =
      tokens.map((t) => t.trim()).where((t) => t.isNotEmpty).toList();
  if (values.isEmpty) {
    throw FormatException('No numbers to sum.');
  }

  // Validate and parse each number
  final numbers = values.map((str) {
    if (!RegExp(r'^\d+$').hasMatch(str)) {
      throw FormatException('Invalid number: "$str"');
    }
    return int.parse(str);
  });

  // Sum all parsed numbers
  return numbers.reduce((sum, n) => sum + n);
}

extension UtilExtensions on String {
  List<String> multiSplit(Iterable<String> delimeters) => delimeters.isEmpty
      ? [this]
      : this.split(RegExp(delimeters.map(RegExp.escape).join('|')));
}
