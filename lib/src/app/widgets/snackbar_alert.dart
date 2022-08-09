
import 'package:flutter/material.dart';
import 'package:movies/src/domain/entities/type_alert_snackbar_model.dart';

enum TypeAlert {
  success,
  error,
}

const Map<String, TypeAlertSnackBar> typeAlert = {
  'success': TypeAlertSnackBar(
    label: 'Success',
    color: Colors.green,
    icon: Icons.check_circle,
  ),
  'error': TypeAlertSnackBar(
    label: 'Error',
    icon: Icons.error,
    color: Colors.red,
  ),
};

class SnackBarFloating {
  static void show(
    BuildContext context,
    String message, {
    IconData? icon,
    Color? backgroundColor,
    TypeAlert type = TypeAlert.success,
    Duration duration = const Duration(seconds: 3),
  }) {
    final _typeAlert = _getTypeAlertSnackBar(type).copyWith(
      icon: icon,
      label: message,
      color: backgroundColor,
    );

    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            _typeAlert.icon,
            size: 22,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(_typeAlert.label),
        ],
      ),
      duration: duration,
      backgroundColor: _typeAlert.color,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static TypeAlertSnackBar _getTypeAlertSnackBar(TypeAlert type) {
    switch (type) {
      case TypeAlert.error:
        return typeAlert['error']!;
      default:
        return typeAlert['success']!;
    }
  }
}
