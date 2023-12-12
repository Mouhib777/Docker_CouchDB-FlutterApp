import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Api_Service/getStudent.dart';
import 'package:flutter_application_3/Model/student.dart';

class EditStudent extends StatefulWidget {
  final studentId;
  final studentName;
  const EditStudent(
      {super.key, required this.studentId, required this.studentName});

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  final ApiService apiService =
      ApiService('http://20.189.116.244:5984', 'lcs3im_students');
  late Future<Student> futureStudent;
  @override
  void initState() {
    super.initState();
    futureStudent = apiService.getStudentById(widget.studentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(widget.studentName),
      ),
      body: FutureBuilder<Student>(
        future: futureStudent,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final Student student = snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(student.lastName),
                  subtitle: Text(student.email),
                  trailing: Text(student.iqLevel),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
