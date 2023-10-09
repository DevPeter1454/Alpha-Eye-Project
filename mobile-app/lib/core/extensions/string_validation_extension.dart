extension ValidationExtension on String {
  String? validateFieldNotEmpty() => isEmpty ? 'Required' : null;

  // String? validateFieldNotNull() => this == null ? 'Required' : null;

  String? validateFullName() {
    // if (this == null) return 'Please fill in this field';

    if (isEmpty) return 'Please fill in this field';

    if (split(' ').length < 2) return 'Please enter your FULL NAME';
    return null;
  }

  String? validateEmailAddress() {
    // if (value == null) return 'Please fill in this field';

    if (isEmpty) return 'Required';

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);

    return !emailValid ? 'Invalid email address' : null;
  }

  String? validatePhoneNumber() {
    // if (value == null) return 'Required';

    if (isEmpty) return 'Required';

    bool phoneNumberValid = isNumber(this);

    return !phoneNumberValid
        ? 'Please check correct phone number format'
        : null;
  }

  bool isNumber(String item) {
    bool value = true;
    item.split('').forEach((e) {
      if (!('0123456789'.contains(e))) value = false;
    });
    return value;
  }

  String? validatePassword({String? confirmPassword}) {
    if (isEmpty) {
      return 'Required';
    }

    if (length < 6) {
      return 'Password must be at least 6 characters';
    }

    if (confirmPassword != null) {
      if (length < 8) {
        return 'Use eight (8) characters minimum';
      } else if (this != confirmPassword) {
        return 'Passwords do not match';
      }
    }
    return null;
  }
}
