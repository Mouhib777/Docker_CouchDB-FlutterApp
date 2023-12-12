import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Api_Service/studentServices.dart';
import 'package:flutter_application_3/Model/student.dart';
import 'package:flutter_application_3/screens/lcs_imStudents.dart';

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
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final Student student = snapshot.data!;
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Student id : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10),
                            ),
                            Text(
                              "${student.id}",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 160,
                        ),
                        Row(
                          children: [
                            Text(
                              "Full Name : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              "${student.firstName}${student.lastName}",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "Email : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              "${student.email}",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "Phone number : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              "+216 ${student.phoneNumber}",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "Baccalauréat : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              "${student.bac}",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "IQ Level: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              "${student.iqLevel}",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: 80,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Edit",
                            style: TextStyle(color: Colors.red),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.red)),
                        )),
                    SizedBox(
                        width: 80,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(PageRouteBuilder(
                                  transitionDuration: Duration.zero,
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      Lcs_im_Students()));
                            },
                            child: Text("Delete")))
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
