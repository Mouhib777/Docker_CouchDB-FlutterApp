import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign in",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Email address",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            Container(
              height: screenHeight * 0.1,
              // width: screenWid,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all()),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.08,
            ),
            Text(
              "Password",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            Container(
              height: screenHeight * 0.1,
              // width: screenWid,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all()),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            SizedBox(
              width: screenWidth * 0.6,
              height: screenHeight * 0.07,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      transitionDuration: Duration.zero,
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          HomeScreen()));
                },
                child: Text("Login",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
