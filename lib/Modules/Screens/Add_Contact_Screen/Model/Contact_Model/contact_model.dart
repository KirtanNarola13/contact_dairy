import 'package:image_picker/image_picker.dart';

class Contact {
  String name;
  String email;
  String phone;

  static XFile? image;

  Contact({
    required this.name,
    required this.email,
    required this.phone,
  });
}
