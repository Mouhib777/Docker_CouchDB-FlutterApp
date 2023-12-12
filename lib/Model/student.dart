class Student {
  final String id;
  final String rev;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String bac;
  final String iqLevel;

  Student({
    required this.id,
    required this.rev,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.bac,
    required this.iqLevel,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['_id'].toString(),
      rev: json['_rev'].toString(),
      firstName: json['firstName'].toString(),
      lastName: json['lastName'].toString(),
      email: json['email'].toString(),
      phoneNumber: json['phoneNumber'].toString(),
      bac: json['bac'].toString(),
      iqLevel: json['iqLevel'].toString(),
    );
  }
}
