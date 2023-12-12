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
      return data.map((json) => Student.fromJson(json)).toList();
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Failed to load students');
    }
  }
}
