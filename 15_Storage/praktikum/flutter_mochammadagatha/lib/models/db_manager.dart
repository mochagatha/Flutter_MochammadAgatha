class Contact {
  final int? id;
  final String name;
  final String phoneNumber;
  final String date;
  final String color;
  final String fileName;

  Contact({
    this.id,
    required this.name,
    required this.phoneNumber,
    required this.date,
    required this.color,
    required this.fileName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'date': date,
      'color': color,
      'fileName': fileName,
    };
  }
}
