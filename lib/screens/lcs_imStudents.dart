import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Api_Service/getStudent.dart';
import 'package:flutter_application_3/Model/student.dart';
import 'package:flutter_application_3/screens/addStudent.dart';
import 'package:flutter_application_3/screens/editStudent.dart';
import 'package:flutter_application_3/screens/home.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Lcs_im_Students extends StatefulWidget {
  const Lcs_im_Students({super.key});

  @override
  State<Lcs_im_Students> createState() => _Lcs_im_StudentsState();
}

class _Lcs_im_StudentsState extends State<Lcs_im_Students> {
  List<Student> students = [];
  final String serverUrl = 'http://20.189.116.244:5984';
  final String dbName = 'lcs3im_students';
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
      body: FutureBuilder<List<Student>>(
        future: ApiService(serverUrl, dbName).getStudents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ya idriss 7el serveur\n ${snapshot.error}');
          } else {
            final List<Student> students = snapshot.data!;
            return ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        transitionDuration: Duration.zero,
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            EditStudent(
                              studentId: student.id,
                              studentName:
                                  "${student.firstName}${student.lastName}",
                            )));
                    EasyLoading.showToast(student.id);
                  },
                  child: ListTile(
                    leading: Image.asset('assets/graduated.png'),
                    title: Text(student.lastName),
                    subtitle: Text(student.email),
                    trailing: Text('IQ: ${student.iqLevel}'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
