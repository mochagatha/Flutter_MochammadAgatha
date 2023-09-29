import 'package:flutter/material.dart';

class ContactModel {
  String name;
  String number;
  String date;
  Color color;
  String file;

  ContactModel({
    required this.name,
    required this.number,
    required this.date,
    required this.color,
    required this.file,
  });

  void edit(
    String? name,
    String? number,
    String? date,
    Color? color,
    String? file,
  ) {
    if (name != null) {
      this.name = name;
    }
    if (number != null) {
      this.number = number;
    }
    if (date != null) {
      this.date = date;
    }
    if (color != null) {
      this.color = color;
    }
    if (file != null) {
      this.file = file;
    }
  }
}