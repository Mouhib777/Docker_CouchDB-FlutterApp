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
}
