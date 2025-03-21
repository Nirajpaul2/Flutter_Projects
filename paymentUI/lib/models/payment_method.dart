import 'package:flutter/widgets.dart';

class PaymentMethod {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool disabled;

  PaymentMethod({
    required this.title,
    required this.icon,
    required this.subtitle,
    required this.disabled,
  });
}
