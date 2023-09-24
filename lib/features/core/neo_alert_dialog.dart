import 'package:flutter/material.dart';
import 'package:neonyx/features/common/neo_colors.dart';

class NeoAlertDialog {
  static Future<bool?> showTTAlertDialog({
    required BuildContext context,
    required Widget content,
    bool isDismissible = true,
  }) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: isDismissible,
      barrierColor: const Color.fromRGBO(19, 9, 49, 0.24),
      builder: (context) => AlertDialog(
        elevation: 5,
        content: content,
        backgroundColor: NeoColors.buttonBackgroundColor,
        contentPadding: const EdgeInsets.all(0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
      ),
    );
  }
}
