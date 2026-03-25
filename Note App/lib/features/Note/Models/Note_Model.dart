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

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      title: json['title'],
      category: json['category'],
      date: json['date'],
      color: Color(json['color']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'date': date,
      'color': color.value,
    };
  }
}
