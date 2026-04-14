import 'package:flutter/material.dart';

class Recent_NoteModel {
  final String? id;
  final String title;
  final String category;
  final String date;
  final Color color;
  final String FolderId;

  Recent_NoteModel({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.color,
    required this.FolderId,
  });

  factory Recent_NoteModel.fromJson(Map<String, dynamic> json) {
    return Recent_NoteModel(
      FolderId: json['Folder_id'],
      id: json['id'],
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
