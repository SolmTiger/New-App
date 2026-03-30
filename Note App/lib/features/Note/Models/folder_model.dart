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

  factory FolderModel.fromMap(Map<String, dynamic> map) {
    return FolderModel(
      id: map['id'].toString(),
      title: map['titel'] ?? '', // لاحظ إنها titel في السوبابيز عندك
      notesCount: "0",
      colors: [Color(map['color'] as int)],
      icon: IconData(int.parse(map['icon']), fontFamily: 'MaterialIcons'),
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
