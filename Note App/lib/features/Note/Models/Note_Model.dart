import 'package:flutter/material.dart';

class NoteModel {
  final String id;
  final String title;
  final String category;
  final String date;
  final Color color;

  NoteModel({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.color,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      date: json['date'],
      color: Color(json['color']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'date': date,
      'color': color.value,
    };
  }
}
