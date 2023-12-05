import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro_Screen extends StatelessWidget {
  const Intro_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Contact Diary App",
            body:
                "These apps provide a convenient way to maintain a digital record of meetings, appointments, and encounters with different individuals. Users can log the date, time, location, and duration of each interaction.",
            image: Image.network(
                "https://i.pinimg.com/564x/76/2e/05/762e0521caf4756caa68dbf7054e4efb.jpg",
                height: 450.0),
          ),
          PageViewModel(
            title: "Contact Diary App",
            body:
                "he best contact diary apps have intuitive interfaces that make it easy for users to input and retrieve information quickly.",
            image: Image.network(
                "https://i.pinimg.com/564x/1f/d7/5d/1fd75dd07c4f6195547636d688f5893c.jpg",
                height: 450.0),
          ),
          PageViewModel(
            title: "Contact Diary App",
            body:
                "Users often have the ability to customize their contact diary apps, adding notes, tags, or other metadata to entries for better organization and recall.",
            image: Image.network(
                "https://i.pinimg.com/564x/4b/e9/a9/4be9a97e50050c57f5e3c73cc4c8974a.jpg",
                height: 550.0),
          ),
        ],
        showSkipButton: true,
        showNextButton: true,
        next: Text("Next"),
        skip: const Text("Skip"),
        done: const Text("Done"),
        onDone: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();

          preferences.setBool('isIntroVisited', true);
          Navigator.pushReplacementNamed(context, 'home');
        },
      ),
    );
  }
}
