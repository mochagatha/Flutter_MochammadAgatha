class ModelContact {
  int? id;
  String name = '';
  String nomor = '';
  String date = '';
  String color = '';
  String file = '';

  ModelContact(
      {this.id,
      required this.name,
      required this.nomor,
      required this.date,
      required this.color,
      required this.file});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'nomor': nomor,
      'date': date,
      'color': color,
      'file': file,
    };
  }
}
