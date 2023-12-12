import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/addStudent.dart';
import 'package:flutter_application_3/screens/home.dart';

class Lcs_im_Students extends StatefulWidget {
  const Lcs_im_Students({super.key});

  @override
  State<Lcs_im_Students> createState() => _Lcs_im_StudentsState();
}

class _Lcs_im_StudentsState extends State<Lcs_im_Students> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(PageRouteBuilder(
                  transitionDuration: Duration.zero,
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      HomeScreen()));
            },
            icon: Icon(
              CupertinoIcons.back,
              size: 30,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    transitionDuration: Duration.zero,
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        AddStudent()));
              },
              icon: Icon(CupertinoIcons.add))
        ],
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: Text("LCS3IM Students"),
        centerTitle: true,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
