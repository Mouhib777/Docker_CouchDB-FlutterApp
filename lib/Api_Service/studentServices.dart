import 'dart:convert';
import 'package:flutter_application_3/Model/student.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String serverUrl;
  final String dbName;

  ApiService(this.serverUrl, this.dbName);

  Future<List<Student>> getStudents() async {
    final response = await http.get(
      Uri.parse('$serverUrl/$dbName/_all_docs'),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('admin:password'))}',
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['rows'];
      final List<Student> students = [];

      for (var entry in data) {
        final docId = entry['id'];

        final docResponse = await http.get(
          Uri.parse('$serverUrl/lcs3im_students/$docId'),
          headers: {
            'Authorization':
                'Basic ${base64Encode(utf8.encode('admin:password'))}',
          },
        );
        

        if (docResponse.statusCode == 200) {
          final Map<String, dynamic> docData = json.decode(docResponse.body);
          final Student student = Student.fromJson(docData);
          students.add(student);
        } else {
          throw Exception(
              'Failed to load student details: ${docResponse.reasonPhrase}');
        }
      }

      return students;
    } else {
      throw Exception('Failed to load students: ${response.reasonPhrase}');
    }
  }

  Future<Student> getStudentById(String studentId) async {
    final response = await http.get(
      Uri.parse('$serverUrl/$dbName/$studentId'),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('admin:password'))}',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final Student student = Student.fromJson(data);
      return student;
    } else {
      throw Exception(
          'Failed to load student details: ${response.reasonPhrase}');
    }
  }

  Future<void> deleteStudentById(String studentId, String studentRev) async {
    final response = await http.delete(
      Uri.parse('$serverUrl/$dbName/$studentId?rev=$studentRev'),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('admin:password'))}',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else if (response.statusCode != 200) {
      print(response.statusCode);
      print(response.body);
      throw Exception('Failed to delete student: ${response.reasonPhrase}');
    }
  }

  Future<void> updateStudentById(String studentId, String studentRev,
      Map<String, dynamic> updatedData) async {
    final response = await http.put(
      Uri.parse('$serverUrl/lcs3im_students/$studentId?rev=$studentRev'),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('admin:password'))}',
        'Content-Type': 'application/json',
      },
      body: json.encode(updatedData),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to update student: ${response.reasonPhrase}');
    }
  }
}
