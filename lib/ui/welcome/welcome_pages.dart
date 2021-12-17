import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

List<PageViewModel> listPagesViewModel = [
  PageViewModel(
    title: "Welcome to Cheraphy",
    body:
        "Grow at Your Own Pace Explore self help guides & growth paths for proven tips and advice on how to feel better",
    image: Center(
        child: Image.asset("assets/images/overthink.png", height: 450.0)),
    decoration: PageDecoration(
      pageColor: Colors.green.shade100,
    ),
  ),
  PageViewModel(
    title: "You can talk to anyone and anytime you want!",
    body:
        "Be heard by volunteer listeners and chat with others who understand in support chat rooms",
    image:
        Center(child: Image.asset("assets/images/chatting.png", height: 350.0)),
    decoration: PageDecoration(
      pageColor: Colors.greenAccent[150],
    ),
  ),
  PageViewModel(
    title: "Affordable Online Therapy",
    body:
        "Confidential online therapy & counseling with licensed therapists, for \$150 per month",
    image:
        Center(child: Image.asset("assets/images/therapy3.png", height: 600.0)),
    decoration: PageDecoration(
      pageColor: Colors.brown.shade200,
    ),
  ),
];
