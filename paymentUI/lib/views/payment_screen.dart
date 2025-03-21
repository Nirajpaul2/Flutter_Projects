import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'payment_option_card.dart';
import '../controllers/payment_controller.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      init: PaymentController(),
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag Handle
              Container(
                width: 60,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 30),

              // Title
              const Text(
                "Payment",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Divider(height: 50),

              // Payment Options List
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.paymentMethods.length,
                  itemBuilder: (context, index) {
                    final option = controller.paymentMethods[index];
                    return PaymentOptionCard(
                      title: option.title,
                      subtitle: option.subtitle,
                      icon: option.icon,
                      disabled: option.disabled,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
