import 'package:assessment_incubyte/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('sumCommaSeparatedNumbers', () {
    test('simple comma list', () {
      expect(add('1,2,3'), equals(6));
    });

    test('mixed spaces, tabs, newlines, commas', () {
      final input = '\n 1 \t , 2  3\n,4\t5';
      // splits into ["1","2","3","4","5"]
      expect(add(input), equals(15));
    });

    test('leading/trailing separators are ignored', () {
      expect(add(',,1,2,'), equals(3));
      expect(add('\n\n3\n4\n'), equals(7));
    });

    test('multiple separators in a row are ignored', () {
      expect(add('1,, ,\n2'), equals(3));
    });

    test('rejects non‑numeric tokens', () {
      expect(() => add('1, a ,3'), throwsFormatException);
      expect(() => add('x,1,2'), throwsFormatException);
    });

    test('rejects empty overall input', () {
      expect(() => add('   ,  \n '), throwsFormatException);
      expect(() => add(''), throwsFormatException);
    });
  });

  group('sumCommaSeparatedNumbers — custom delimiter', () {
    test('valid semicolon delimiter', () {
      expect(add('//;\n1;2;3'), equals(6));
    });

    test('invalid delimiter containing letter', () {
      expect(() => add('//a\n1a2'), throwsFormatException);
    });

    test('invalid delimiter containing digit', () {
      expect(() => add('//1\n1 1'), throwsFormatException);
    });
  });
}
