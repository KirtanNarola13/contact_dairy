import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Splash_Screen extends StatelessWidget {
  Splash_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    Timer(
      const Duration(seconds: 4),
      () async {
        SharedPreferences preferences = await SharedPreferences.getInstance();

        bool isIntroVisited = preferences.getBool("isIntroVisited") ?? false;
        Navigator.pushReplacementNamed(
            context, (isIntroVisited) ? 'home' : 'intro');
      },
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height / 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: height * 0.6,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://www.icegif.com/wp-content/uploads/2023/07/icegif-1262.gif",
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 5,
            ),
            GradientText(
              'CONTACT DAIRY',
              style: const TextStyle(
                fontSize: 22,
              ),
              gradientType: GradientType.linear,
              radius: 2.5,
              colors: const [
                Colors.orangeAccent,
                Colors.red,
                Colors.pink,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
