import 'package:get/get.dart';
import '../models/payment_method.dart';
import 'package:flutter/material.dart';

class PaymentController extends GetxController {
  var paymentMethods = <PaymentMethod>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadPaymentMethods();
  }

  void loadPaymentMethods() {
    paymentMethods.value = [
      PaymentMethod(
        title: "Credit card",
        subtitle: "Convenience fee: ₹4.50",
        icon: Icons.credit_card,
        disabled: false,
      ),
      PaymentMethod(
        title: "Debit card",
        subtitle: "Convenience fee: ₹4.50",
        icon: Icons.credit_card,
        disabled: false,
      ),
      PaymentMethod(
        title: "Net banking",
        subtitle: "Convenience fee: ₹4.50",
        icon: Icons.credit_card,
        disabled: false,
      ),
      PaymentMethod(
        title: "UPI",
        subtitle: "Convenience fee: ₹4.50",
        icon: Icons.credit_card,
        disabled: false,
      ),
      PaymentMethod(
        title: "Rupay",
        subtitle: "Convenience fee: ₹4.50",
        icon: Icons.credit_card,
        disabled: false,
      ),
      PaymentMethod(
        title: "Net banking",
        subtitle: "Convenience fee: ₹4.50",
        icon: Icons.credit_card,
        disabled: true,
      ),
    ];
  }
}
