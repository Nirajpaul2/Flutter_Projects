import 'package:flutter/material.dart';

class PaymentOptionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool disabled;

  const PaymentOptionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.subtitle,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? 0.5 : 1.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: disabled ? Colors.grey.shade300 : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Row(
          children: [
            // Icon inside a container
            Container(
              height: 50,
              padding: const EdgeInsets.only(
                left: 8,
                right: 0,
                bottom: 25,
                top: 0,
              ),

              child: Icon(icon, color: Colors.black, size: 28),
            ),

            // Space between icon and text
            const SizedBox(width: 12),

            // Title and subtitle in a column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),

            // Trailing arrow icon
            const Icon(Icons.arrow_forward_ios, color: Colors.purple, size: 18),
          ],
        ),
      ),
    );
  }
}
