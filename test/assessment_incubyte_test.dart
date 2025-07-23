import 'package:assessment_incubyte/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('sumCommaSeparatedNumbers', () {
    test('should return correct sum for valid input', () {
      expect(add('10,20,30'), equals(60));
      expect(add('1,2,3'), equals(6));
    });

    test('should throw FormatException for invalid numbers', () {
      expect(() => add('10,a,30'), throwsFormatException);
    });
  });
}
