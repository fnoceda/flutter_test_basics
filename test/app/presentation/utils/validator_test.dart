import 'package:flutter_test/flutter_test.dart';
import 'package:initial/app/presentation/utils/validator.dart';

void main() {
  setUpAll(() {
    print('setUpAll');
  });
  tearDownAll(() {
    print('tearDownAll');
  });

  group('isValidEmail > ', () {
    test('false', () {
      expect(isValidEmail('text'), false);
      expect(isValidEmail('fnoceda@gmail.com'), true);
      expect(isValidEmail('fnoceda#lala@gmail.com'), false);
      expect(isValidEmail('1fnocedalala@gmail.com'), false);
      expect(isValidEmail('francisco.noceda@gmail.com'), true);
    });

    test('short', () {
      final errors = isValidPassword('test');
      expect(errors.length, 3);
      expect(errors.length == 3, true);
      expect(errors.contains(PasswordErrors.atLeast6Characters), true);
      expect(errors.contains(PasswordErrors.atLeast1UpperCase), true);
      expect(errors.contains(PasswordErrors.atLeast1Number), true);
    });
    test('length', () {
      final errors = isValidPassword('testabc');
      expect(errors.length, 2);
      expect(errors.length == 2, true);
      expect(errors.contains(PasswordErrors.atLeast6Characters), false);
      expect(errors.contains(PasswordErrors.atLeast1UpperCase), true);
      expect(errors.contains(PasswordErrors.atLeast1Number), true);
    });
    test('number', () {
      final errors = isValidPassword('testabc1');
      expect(errors.length, 1);
      expect(errors.length == 1, true);
      expect(errors.contains(PasswordErrors.atLeast1Number), false);
      expect(errors.contains(PasswordErrors.atLeast1Number), false);
      expect(errors.contains(PasswordErrors.atLeast1UpperCase), true);
    });

    test('whiteSpace', () {
      final errors = isValidPassword('Test bc1');
      expect(errors.isEmpty, false);
      expect(errors.contains(PasswordErrors.whiteSpaces), true);
    });

    test('success', () {
      final errors = isValidPassword('Testabc1');
      expect(errors.isEmpty, true);
    });
  });
}
