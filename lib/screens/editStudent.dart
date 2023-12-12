import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Api_Service/studentServices.dart';
import 'package:flutter_application_3/screens/lcs_imStudents.dart';

class EditStudent extends StatefulWidget {
  final studentId;

  final studentRev;
  final firstName;
  final lastName;
  final email;
  final phoneNumber;
  final bac;
  final iqLevel;
  const EditStudent(
      {super.key,
      required this.studentId,
      required this.studentRev,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.bac,
      required this.iqLevel});

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController bacController;
  late TextEditingController iqLevelController;
  final ApiService apiService =
      ApiService('http://20.189.116.244:5984', 'lcs3im_students');

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController(text: widget.firstName);
    lastNameController = TextEditingController(text: widget.lastName);
    emailController = TextEditingController(text: widget.email);
    phoneNumberController = TextEditingController(text: widget.phoneNumber);
    bacController = TextEditingController(text: widget.bac);
    iqLevelController = TextEditingController(text: widget.iqLevel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: bacController,
              decoration: InputDecoration(labelText: 'Bac'),
            ),
            TextField(
              controller: iqLevelController,
              decoration: InputDecoration(labelText: 'IQ Level'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                try {
                  await apiService.updateStudentById(
                    widget.studentId,
                    widget.studentRev,
                    {
                      'firstName': firstNameController.text,
                      'lastName': lastNameController.text,
                      'email': emailController.text,
                      'phoneNumber': phoneNumberController.text,
                      'bac': bacController.text,
                      'iqLevel': iqLevelController.text,
                    },
                  );
                  Navigator.of(context).push(PageRouteBuilder(
                      transitionDuration: Duration.zero,
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Lcs_im_Students()));
                } catch (e) {
                  print('Error updating student: $e');
                }
              },
              child: Text('Update student'),
            ),
          ],
        ),
      ),
    );
  }
}
