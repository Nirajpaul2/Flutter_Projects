class ContactModel {
  String title;
  List<ContactDetail> details;
  bool isExpanded;

  ContactModel({
    required this.title,
    this.details = const [],
    this.isExpanded = false,
  });
}

class ContactDetail {
  String icon;
  String label;
  bool isLink;

  ContactDetail({required this.icon, required this.label, this.isLink = false});
}
