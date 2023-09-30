class ModelContact {
  late int id;
  String name = '';
  String nomor = '';
  String date = '';
  String color = '';
  String file = '';

  ModelContact(
      {required this.name,
      required this.nomor,
      required this.date,
      required this.color,
      required this.file});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nomor': nomor,
      'date': date,
      'color': color,
      'file': file,
    };
  }
}
