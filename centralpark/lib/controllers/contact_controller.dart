import 'package:get/get.dart';
import '../models/contact_model.dart';

class ContactController extends GetxController {
  var searchQuery = ''.obs;
  var contacts =
      <ContactModel>[
        ContactModel(
          title: "Admin",
          details: [
            ContactDetail(icon: "person", label: "Shreya Jha", isLink: true),
            ContactDetail(icon: "phone", label: "1800-4568"),
            ContactDetail(icon: "email", label: "Support@anarock.com"),
          ],
        ),
        ContactModel(
          title: "Reception",
          details: [
            ContactDetail(icon: "phone", label: "1800-4568"),
            ContactDetail(
              icon: "email",
              label: "reception@nucleusofficeparks.com",
            ),
          ],
        ),
        ContactModel(title: "Building Admin"),
        ContactModel(
          title: "Facilities",
          details: [
            ContactDetail(icon: "phone", label: "1800-4568"),
            ContactDetail(
              icon: "email",
              label: "reception@nucleusofficeparks.com",
            ),
          ],
        ),
      ].obs;

  void updateSearch(String query) {
    searchQuery.value = query;
  }
}
