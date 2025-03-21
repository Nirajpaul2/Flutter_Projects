import 'package:flutter/material.dart';
import '../models/contact_model.dart';

class ContactTile extends StatefulWidget {
  final ContactModel contact;
  const ContactTile({required this.contact});

  @override
  _ContactTileState createState() => _ContactTileState();
}

class _ContactTileState extends State<ContactTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          title: Text(
            widget.contact.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          initiallyExpanded: isExpanded,
          onExpansionChanged: (value) {
            setState(() {
              isExpanded = value;
            });
          },
          children:
              widget.contact.details.map((detail) {
                return ListTile(
                  leading: Icon(_getIcon(detail.icon), color: Colors.purple),
                  title:
                      detail.isLink
                          ? InkWell(
                            onTap: () {},
                            child: Text(
                              detail.label,
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                          : Text(detail.label),
                );
              }).toList(),
        ),
        Divider(),
      ],
    );
  }

  IconData _getIcon(String icon) {
    switch (icon) {
      case "person":
        return Icons.person;
      case "phone":
        return Icons.phone;
      case "email":
        return Icons.email;
      default:
        return Icons.info;
    }
  }
}
