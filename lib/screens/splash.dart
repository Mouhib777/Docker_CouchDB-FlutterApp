import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/home.dart';
import 'package:flutter_application_3/screens/login.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    Timer(
        Duration(
          milliseconds: 3200,
        ), () async {
      Navigator.of(context).push(PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (context, animation, secondaryAnimation) =>
              LoginScreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.32,
            ),
            FadeInDownBig(
              child: Text(
                "Mouhidriss",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    letterSpacing: 5),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              children: [
                SlideInUp(
                  child: FadeInLeft(
                    child: Image.asset(
                      "assets/mouhib.jpeg",
                      height: 180,
                      width: 199,
                    ),
                  ),
                ),
                SlideInUp(
                  child: FadeInRight(
                    // delay: Duration(milliseconds: 2600),
                    child: Image.asset(
                      "assets/idriss.jpeg",
                      height: 180,
                      width: 170,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
