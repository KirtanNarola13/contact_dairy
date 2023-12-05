// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

import '../../Add_Contact_Screen/Model/Contact_Model/contact_model.dart';

class Contact_Detail_Screen extends StatelessWidget {
  Contact_Detail_Screen({super.key});

  TextStyle myStyle = const TextStyle(fontSize: 22);
  Color iconColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    Contact data = ModalRoute.of(context)?.settings.arguments as Contact;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Detail"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            const CircleAvatar(
              backgroundColor: Colors.deepPurple,
              radius: 110,
              child: CircleAvatar(
                radius: 100,
              ),
            ),
            Text(
              "${data.name}",
              style: const TextStyle(fontSize: 25),
            ),
            Text(
              "+91 ${data.phone}",
              style: myStyle,
            ),
            Text(
              "${data.email}",
              style: const TextStyle(fontSize: 16),
            ),
            // const Divider(),
            // const SizedBox(
            //   height: 20,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     FloatingActionButton(
            //       backgroundColor: Colors.green.withOpacity(0.6),
            //       onPressed: () {
            //         launchUrl(Uri(scheme: "tel", path: "${data.phone}"));
            //       },
            //       child: Icon(Icons.call, color: iconColor),
            //     ),
            //     FloatingActionButton(
            //       backgroundColor: Colors.blue.withOpacity(0.6),
            //       onPressed: () {
            //         launchUrl(Uri(scheme: "sms", path: "${data.phone}"));
            //       },
            //       child: Icon(Icons.message, color: iconColor),
            //     ),
            //     FloatingActionButton(
            //       backgroundColor: Colors.red.withOpacity(0.6),
            //       onPressed: () {
            //         launchUrl(Uri(scheme: "mailto", path: "${data.email}"));
            //       },
            //       child: Icon(Icons.mail, color: iconColor),
            //     ),
            //     FloatingActionButton(
            //       backgroundColor: Colors.yellow.withOpacity(0.6),
            //       onPressed: () {
            //         Share.share("${data.name}"
            //             "+91 ${data.phone}"
            //             "${data.email}");
            //       },
            //       child: Icon(Icons.share, color: iconColor),
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // const Divider(),
          ],
        ),
      ),
    );
  }
}
