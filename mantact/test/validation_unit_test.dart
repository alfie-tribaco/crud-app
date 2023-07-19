import 'package:flutter_test/flutter_test.dart';
import 'package:mantact/app/utils/helper/validation_helper.dart';

void main() {
  group('Unit Test for Validation of Email', () {
    test('should return true for valid email', () {
      var validationHelper = ValidationHelper();
      expect(validationHelper.checkEmailIsValid('alfie@gmail.com'), true);
      expect(validationHelper.checkEmailIsValid('alfietribaco245@yahoo.com'),
          true);
      expect(validationHelper.checkEmailIsValid('hello123@yahoo.com.ph'), true);
      expect(validationHelper.checkEmailIsValid('mactribaco@tip.edu.ph'), true);
    });

    test('should return false for invalid email', () {
      var validationHelper = ValidationHelper();
      expect(validationHelper.checkEmailIsValid('invalid_email'), false);
      expect(validationHelper.checkEmailIsValid('invalid_email@'), false);
      expect(validationHelper.checkEmailIsValid('@example.com'), false);
      expect(validationHelper.checkEmailIsValid('test@example'), false);
      expect(validationHelper.checkEmailIsValid('test@.com'), false);
    });
  });

  group('Unit Test for Validation of Number', () {
    test('should return true for valid number', () {
      var validationHelper = ValidationHelper();
      expect(validationHelper.checkCellPhoneNumberIsValid('09234685313'), true);
      expect(validationHelper.checkCellPhoneNumberIsValid('09945812324'), true);
      expect(validationHelper.checkCellPhoneNumberIsValid('09234567567'), true);
    });

    test('should return false for invalid number', () {
      var validationHelper = ValidationHelper();

      expect(validationHelper.checkCellPhoneNumberIsValid('945348345'), false);
      expect(validationHelper.checkCellPhoneNumberIsValid('asdasd'), false);
      expect(validationHelper.checkCellPhoneNumberIsValid('91283123#@'), false);
      expect(validationHelper.checkCellPhoneNumberIsValid('092384092384092384'),
          false);
    });
  });
}
