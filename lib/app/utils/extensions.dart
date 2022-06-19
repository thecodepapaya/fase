import 'package:flutter/material.dart';

extension APIStatus on int? {
  bool get isSuccess {
    late final bool success;

    if (this == null) {
      return false;
    }

    if (this! >= 200 && this! < 300) {
      success = true;
    } else {
      success = false;
    }

    return success;
  }
}

extension StringCapitalization on String {
  String get capitalize {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension Colorify on String {
  Color? get getColorFromHex {
    late final Color color;

    final isColorValid = length == 7;

    if (!isColorValid) {
      color = Colors.transparent;
    } else {
      final colorHex = substring(1);

      color = Color(int.parse(colorHex, radix: 16) + 0xFF000000);
    }

    return color;
  }
}
