import 'dart:developer';
import 'dart:io';

import 'package:contact_diary_app_2/Modules/Screens/Add_Contact_Screen/Model/Contact_Model/contact_model.dart';
import 'package:contact_diary_app_2/Modules/Screens/Add_Contact_Screen/Providers/Contact_Provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../Utils/Globals/globals.dart';

class Add_Contact_Screen extends StatefulWidget {
  const Add_Contact_Screen({super.key});

  @override
  State<Add_Contact_Screen> createState() => _Add_Contact_ScreenState();
}

class _Add_Contact_ScreenState extends State<Add_Contact_Screen> {
  @override
  Widget build(BuildContext context) {
    //

    //
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              log("${Global.email}");
              log("${Global.name}");
              log("${Global.phone}");

              Provider.of<ContactProvider>(context, listen: false).addContact(
                contact_details: Contact(
                  name: Global.name!,
                  email: Global.email!,
                  phone: Global.phone!,
                ),
              );
              Global.nameController.clear();
              Global.emailController.clear();
              Global.phoneController.clear();

              Navigator.pushReplacementNamed(context, 'home');
            },
            icon: Icon(Icons.add),
          ),
        ],
        title: Text("Add Contact Here"),
        centerTitle: true,
      ),
      body: Stepper(
        onStepContinue: () {
          setState(() {
            if (Global.currentIndex != 3) {
              Global.currentIndex++;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (Global.currentIndex != 0) {
              Global.currentIndex--;
            }
          });
        },
        currentStep: Global.currentIndex,
        steps: [
          Step(
            state: (Global.currentIndex == 0)
                ? StepState.editing
                : StepState.indexed,
            isActive: (Global.currentIndex == 0) ? true : false,
            title: Text("Photo"),
            content: Column(
              children: [
                CircleAvatar(
                  radius: 80,
                  foregroundImage: FileImage(File("${Global.imgPath}")),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () async {
                        Contact.image = await Global.img_picker
                            .pickImage(source: ImageSource.camera);
                        setState(() {
                          Global.imgPath = Contact.image!.path;
                          log("${Global.imgPath}");
                        });
                      },
                      icon: Icon(Icons.camera_alt_outlined),
                    ),
                    IconButton(
                      onPressed: () async {
                        Contact.image = await Global.img_picker
                            .pickImage(source: ImageSource.gallery);
                        setState(() {
                          Global.imgPath = Contact.image!.path;
                          log("${Global.imgPath}");
                        });
                      },
                      icon: Icon(Icons.image),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Step(
            state: (Global.currentIndex == 1)
                ? StepState.editing
                : StepState.indexed,
            isActive: (Global.currentIndex == 1) ? true : false,
            title: Text("Name"),
            content: TextFormField(
              controller: Global.nameController,
              onChanged: (val) {
                setState(() {
                  Global.name = val;
                });
              },
              decoration: const InputDecoration(
                  hintText: "Enter Your Name", border: OutlineInputBorder()),
            ),
          ),
          Step(
            state: (Global.currentIndex == 2)
                ? StepState.editing
                : StepState.indexed,
            isActive: (Global.currentIndex == 2) ? true : false,
            title: Text("Phone"),
            content: TextFormField(
              maxLength: 10,
              keyboardType: TextInputType.phone,
              controller: Global.phoneController,
              onChanged: (val) {
                setState(() {
                  Global.phone = val;
                });
              },
              decoration: InputDecoration(
                  hintText: "Enter Your phone", border: OutlineInputBorder()),
            ),
          ),
          Step(
            state: (Global.currentIndex == 3)
                ? StepState.editing
                : StepState.indexed,
            isActive: (Global.currentIndex == 3) ? true : false,
            title: Text("Email"),
            content: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: Global.emailController,
              onChanged: (val) {
                setState(() {
                  Global.email = val;
                });
              },
              decoration: InputDecoration(
                hintText: "Enter Your Email",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
