String? requiredValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'This field cannot be empty';
  }
  return null;
}

String? emailValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Email is required';
  }

  final emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  if (!emailRegex.hasMatch(value.trim())) {
    return 'Please enter a valid email address';
  }

  return null;
}

String? phoneValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Phone number is required';
  }

  final phone = value.trim();

  // Egyptian phone format: 01XXXXXXXXX (11 digits)
  final phoneRegex = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');

  if (!phoneRegex.hasMatch(phone)) {
    return 'Please enter a valid 11-digit Egyptian phone number';
  }

  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Password is required';
  }

  final password = value.trim();

  if (password.length < 8) {
    return 'Password must be at least 8 characters long';
  }

  if (!RegExp(r'[A-Z]').hasMatch(password)) {
    return 'Password must contain at least one uppercase letter';
  }

  if (!RegExp(r'[a-z]').hasMatch(password)) {
    return 'Password must contain at least one lowercase letter';
  }

  if (!RegExp(r'[0-9]').hasMatch(password)) {
    return 'Password must contain at least one number';
  }

  return null;
}