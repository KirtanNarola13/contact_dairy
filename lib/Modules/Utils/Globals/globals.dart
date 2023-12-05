import 'package:flutter/cupertino.dart';

class Global {
  static int currentIndex = 0;

  static TextEditingController nameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();

  static String? name;
  static String? email;
  static String? phone;
}
