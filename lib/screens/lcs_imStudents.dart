import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Model/student.dart';
import 'package:flutter_application_3/screens/addStudent.dart';
import 'package:flutter_application_3/screens/home.dart';

class Lcs_im_Students extends StatefulWidget {
  const Lcs_im_Students({super.key});

  @override
  State<Lcs_im_Students> createState() => _Lcs_im_StudentsState();
}

class _Lcs_im_StudentsState extends State<Lcs_im_Students> {
  List<Student> students = [];
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
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(
                      'assets/your_image.png'), // Replace with your actual image path
                  title: Text(
                      '${students[index].lastName}, ${students[index].firstName}'),
                  subtitle: Text('Email: ${students[index].email}'),
                  trailing: Text('IQ: ${students[index].iqLevel}'),
                  onTap: () {
                    // Add any action you want when a student tile is tapped
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
