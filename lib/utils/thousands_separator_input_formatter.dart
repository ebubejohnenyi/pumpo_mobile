import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat('#,###');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Prevent empty input
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Remove all commas
    String newText = newValue.text.replaceAll(',', '');

    // Prevent invalid number parsing
    if (int.tryParse(newText) == null) {
      return oldValue;
    }

    // Format the number with commas
    final formatted = _formatter.format(int.parse(newText));

    // Calculate new cursor position
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
