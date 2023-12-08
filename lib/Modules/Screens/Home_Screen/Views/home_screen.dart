// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'dart:io';

import 'package:contact_diary_app_2/Modules/Screens/Add_Contact_Screen/Providers/Contact_Provider/contact_provider.dart';
import 'package:contact_diary_app_2/Modules/Screens/Home_Screen/Providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Utils/Globals/globals.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  LocalAuthentication authentication = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'add_contact');
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              onSelected: (val) async {
                if (val == 'theme') {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .changeTheme();
                } else if (val == 'hidden') {
                  bool isDeviceSuported =
                      await authentication.isDeviceSupported();
                  bool canCheckBiometrics =
                      await authentication.canCheckBiometrics;

                  try {
                    if (isDeviceSuported == true &&
                        canCheckBiometrics == true) {
                      bool isAuthenticate = await authentication.authenticate(
                          localizedReason:
                              "You Need to Verify your self to see Hidden Contacts..");
                    } else {
                      log("Device is Not Supported.....");
                    }
                  } on PlatformException catch (e) {
                    log("${e.code}");
                    log("${e.message}");
                  }
                }
              },
              itemBuilder: (ctx) => [
                    PopupMenuItem(
                      child: Text("Theme"),
                      value: "theme",
                    ),
                    PopupMenuItem(
                      child: Text("Hidden Contact"),
                      value: "hidden",
                    ),
                  ])
        ],
        title: const Text("Contact Diary"),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        centerTitle: true,
      ),
      body: (Provider.of<ContactProvider>(context, listen: false)
              .allContact
              .isNotEmpty)
          ? ListView.builder(
              itemCount: Provider.of<ContactProvider>(context, listen: false)
                  .allContact
                  .length,
              itemBuilder: (ctx, i) => Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, 'detail',
                        arguments:
                            Provider.of<ContactProvider>(context, listen: false)
                                .allContact[i]);
                  },
                  leading: CircleAvatar(
                    foregroundImage: FileImage(File("${Global.imgPath}")),
                  ),
                  title: Text(
                      Provider.of<ContactProvider>(context, listen: false)
                          .allContact[i]
                          .name),
                  subtitle: Text(
                      Provider.of<ContactProvider>(context, listen: false)
                          .allContact[i]
                          .phone),
                  trailing: IconButton(
                    onPressed: () {
                      launch(
                          "tel:+91${Provider.of<ContactProvider>(context, listen: false).allContact[i].phone}");
                    },
                    icon: const Icon(Icons.call),
                  ),
                ),
              ),
            )
          : Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 440,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage(
                        "lib/Modules/Utils/Assets/no_data.png",
                      ),
                    ),
                  ),
                )
              ],
            )),
    );
  }
}
