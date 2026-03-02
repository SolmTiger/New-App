import 'package:flutter/material.dart';

class NoteModel {
  final String title;
  final String category;
  final String date;
  final Color color;

  NoteModel({
    required this.title,
    required this.category,
    required this.date,
    required this.color,
  });
}
