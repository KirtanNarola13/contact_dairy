import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class Global {
  static int currentIndex = 0;

  static ImagePicker img_picker = ImagePicker();
  static String? imgPath = '';

  static TextEditingController nameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();

  static String? name;
  static String? email;
  static String? phone;
}
