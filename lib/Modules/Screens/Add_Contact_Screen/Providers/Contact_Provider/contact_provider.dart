import 'package:flutter/material.dart';
import '../../Model/Contact_Model/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> allContact = [];

  void addContact({required Contact contact_details}) {
    allContact.add(contact_details);
    notifyListeners();
  }

  void removeContact({required Contact contact_details}) {
    allContact.remove(contact_details);
    notifyListeners();
  }
}
