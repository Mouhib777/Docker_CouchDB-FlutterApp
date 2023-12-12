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
      id: json['_id'],
      rev: json['_rev'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      bac: json['bac'],
      iqLevel: json['iqLevel'],
    );
  }
}
