class Student {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String bac;
  final int iqLevel;

  Student({
    this.id = '',
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
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      bac: json['bac'],
      iqLevel: json['iqLevel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'bac': bac,
      'iqLevel': iqLevel,
    };
  }
}
