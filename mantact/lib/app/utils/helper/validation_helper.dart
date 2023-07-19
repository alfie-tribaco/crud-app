import 'dart:developer';

class ValidationHelper {
  bool? checkEmailIsValid(String email) {
    try {
      final bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);

      return emailValid;
    } catch (e) {
      log('ValidationHelper Exception: $e');
      return null;
    }
  }

  bool? checkCellPhoneNumberIsValid(String number) {
    try {
      final bool numberValid = RegExp(r"^09\d{9}$").hasMatch(number);
      return numberValid;
    } catch (e) {
      log('ValidationHelper Exception: $e');
      return null;
    }
  }
}
