import 'dart:io';

import 'package:assessment_incubyte/string_calculator.dart';

void main() {
  stdout.write('Enter comma-separated numbers: ');
  final input = stdin.readLineSync();

  if (input == null) {
    print('No input provided.');
    return;
  }

  var sum = add(input);

  print("Sum of the given number is: $sum");
}
