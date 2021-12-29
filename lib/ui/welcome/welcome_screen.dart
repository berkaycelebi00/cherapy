import 'package:cheraphy/constants/routes.dart';
import 'package:cheraphy/ui/welcome/welcome_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      pages: listPagesViewModel,
      onDone: () {
        Navigator.popAndPushNamed(context, loginPageRoute);
      },
      onSkip: () {
        // You can also override onSkip callback
      },

      dotsContainerDecorator: BoxDecoration(color: Colors.blueAccent.shade100),
      //showSkipButton: true,
      skip: const Icon(Icons.skip_next),
      next: Icon(
        CupertinoIcons.chevron_right,
        color: Theme.of(context).colorScheme.secondary,
      ),

      done: Text("Done",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.secondary)),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Theme.of(context).colorScheme.secondary,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
    ));
  }
}
