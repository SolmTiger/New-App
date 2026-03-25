import 'package:flutter/material.dart';

class FolderModel {
  final String id;
  final String title;
  final String notesCount;
  final List<Color> colors;
  final IconData icon;

  FolderModel({
    required this.id,
    required this.title,
    required this.notesCount,
    required this.colors,
    required this.icon,
  });

  factory FolderModel.fromJson(Map<String, dynamic> json) {
    return FolderModel(
      id: json['id'],
      title: json['title'],
      notesCount: json['notes_count'],
      colors: List<Color>.from(json['colors'].map((color) => Color(color))),
      icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'notes_count': notesCount,
      'colors': colors.map((color) => color.value).toList(),
      'icon': icon.codePoint,
    };
  }
}
