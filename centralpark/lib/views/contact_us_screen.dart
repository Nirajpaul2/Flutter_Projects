import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/contact_controller.dart';
import 'contact_tile.dart';

class ContactUsScreen extends StatelessWidget {
  final ContactController controller = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text("Contact Us", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              onChanged: controller.updateSearch,
              decoration: InputDecoration(
                hintText: "Search contact...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Contact List
            Expanded(
              // child: Obx(() {
              //   var filteredContacts =
              //       controller.contacts
              //           .where(
              //             (contact) => contact.title.toLowerCase().contains(
              //               controller.searchQuery.value.toLowerCase(),
              //             ),
              //           )
              //           .toList();

              //   return ListView.builder(
              //     itemCount: filteredContacts.length,
              //     itemBuilder: (context, index) {
              //       return ContactTile(contact: filteredContacts[index]);
              //     },
              //   );
              // }),
              child: GetBuilder<ContactController>(
                builder: (_) {
                  var filteredContacts =
                      controller.contacts
                          .where(
                            (contact) => contact.title.toLowerCase().contains(
                              controller.searchQuery.value.toLowerCase(),
                            ),
                          )
                          .toList();

                  return ListView.builder(
                    itemCount: filteredContacts.length,
                    itemBuilder: (context, index) {
                      return ContactTile(contact: filteredContacts[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
