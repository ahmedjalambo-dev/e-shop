import 'package:eshop/core/themes/my_color.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations({
    super.key,
    required this.hasMinLength,
    required this.hasUpperCaseLetter,
    required this.hasLowerCaseLetter,
    required this.hasDigit,
    required this.hasSpecialCharacter,
  });
  final bool hasMinLength;
  final bool hasUpperCaseLetter;
  final bool hasLowerCaseLetter;
  final bool hasDigit;
  final bool hasSpecialCharacter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildValidationRow('At least 8 characters', hasMinLength),
        buildValidationRow('At least one uppercase letter', hasUpperCaseLetter),
        buildValidationRow('At least one lowercase letter', hasLowerCaseLetter),
        buildValidationRow('At least one digit', hasDigit),
        buildValidationRow(
          'At least one special character',
          hasSpecialCharacter,
        ),
      ],
    );
  }

  Widget buildValidationRow(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.cancel,
          color: isValid ? Colors.green.shade300 : MyColor.myGray,
          size: 14,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: isValid ? Colors.green.shade300 : MyColor.myGray,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
