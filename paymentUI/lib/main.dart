import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/payment_screen.dart';

void main() {
  runApp(const PaymentApp());
}

class PaymentApp extends StatelessWidget {
  const PaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomSheet(),
    );
  }
}

class BottomSheet extends StatelessWidget {
  const BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.bottomSheet(
              SizedBox(
                height: MediaQuery.of(context).size.height - 20,
                child: const PaymentScreen(),
              ),
              isScrollControlled: true,
              backgroundColor: Colors.white,
            );
          },
          child: const Text("Proceed to Payment"),
        ),
      ),
    );
  }
}
