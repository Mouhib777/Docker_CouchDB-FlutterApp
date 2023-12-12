import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Model/student.dart';
import 'package:flutter_application_3/screens/addStudent.dart';
import 'package:flutter_application_3/screens/home.dart';
import 'package:http/http.dart' as http;

class Lcs_im_Students extends StatefulWidget {
  const Lcs_im_Students({super.key});

  @override
  State<Lcs_im_Students> createState() => _Lcs_im_StudentsState();
}

class _Lcs_im_StudentsState extends State<Lcs_im_Students> {
  final String serverUrl = 'http://20.189.116.244:5984';
  final String dbName = 'lcs3im_students';
  List<Student> students = [];
  @override
  void initState() {
    super.initState();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    final response = await http.get(Uri.parse('$serverUrl/$dbName/_all_docs'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['rows'];
      final List<String> studentIds =
          data.map((row) => row['id'].toString()).toList();
      final List<Student> fetchedStudents =
          await Future.wait(studentIds.map((id) => fetchStudent(id)));
      setState(() {
        students = fetchedStudents;
      });
    } else {
      print('Failed to fetch students. Status code: ${response.statusCode}');
    }
  }

  Future<void> fetchStudent(String id) async {
    final response = await http.get(Uri.parse('$serverUrl/$dbName/$id'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final Student fetchedStudent = Student.fromJson(data);
      setState(() {
        students.add(fetchedStudent);
      });
    } else {
      print(
          'Failed to fetch student with ID $id. Status code: ${response.statusCode}');
      // Handle the error case if needed
    }
  }

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
