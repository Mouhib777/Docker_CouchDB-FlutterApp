import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/lcs_imStudents.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final String serverUrl = 'http://20.189.116.244:5984';
  final String dbName = 'lcs3im_students';
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController bacController = TextEditingController();
  final TextEditingController iqLevelController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: Text("Add student"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addStudent();
              },
              child: Text('Add Student'),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> addStudent() async {
    final newStudent = {
      'firstName': firstNameController.text,
      'lastName': lastNameController.text,
      'email': emailController.text,
      'phoneNumber': phoneNumberController.text,
      'bac': bacController.text,
      'iqLevel': int.tryParse(iqLevelController.text) ?? 0,
    };

    final response = await http.post(
      Uri.parse('$serverUrl/$dbName'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Basic ${base64Encode(utf8.encode('admin:password'))}',
      },
      body: json.encode(newStudent),
    );

    if (response.statusCode == 201) {
      print('Student added successfully.');
      EasyLoading.showInfo(
          "Status code: ${response.statusCode}\n${response.body}",
          duration: Duration(seconds: 4));

      Navigator.of(context).push(PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (context, animation, secondaryAnimation) =>
              Lcs_im_Students()));
    } else {
      print(
          'Failed to add student. Status code: ${response.statusCode} ${response.body}');
      EasyLoading.showError(
          "Status code: ${response.statusCode}\n${response.body}",
          duration: Duration(seconds: 4));
    }
  }
}
