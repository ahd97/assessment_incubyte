This project implements a String Calculator in Dart as part of a coding assessment. It parses strings containing non-negative integers, handles multiple delimiter types, and returns the sum of those integers. It includes custom error handling and a complete test suite.


📁 Project Structure

assessment_incubyte/
├── lib/
│   └── string_calculator.dart      # Core logic of the calculator
├── bin/
│   └── main.dart                   # CLI entry point to run the calculator
├── test/
│   └── string_calculator_test.dart # Unit test cases
├── pubspec.yaml
└── README.md


🚀 Usage
Run from CLI

dart run bin/main.dart

1,2,3

Or with custom delimiter:

Enter numbers: //;\n1;2;3


⚠️ Error Handling
Throws FormatException in the following cases:

Empty input

Invalid or alphanumeric custom delimiter

Non-numeric tokens like a, xyz

Incorrect delimiter declaration (e.g., missing \n)

🧪 Running Tests

Run all unit tests using:

dart test

✅ Covered Scenarios:
Comma-separated values

Whitespace-separated values

Mixed delimiters

Custom delimiter handling

Malformed input handling

Edge cases like no numbers, invalid custom delimiter, or multiple delimiters
