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
    // 1. استخراج قيمة اللون الأساسي من سوبابيز
    final int mainColorValue = map['color'] as int;
    final Color mainColor = Color(mainColorValue);

    return FolderModel(
      id: map['id'].toString(),
      // تأكد هل هي 'titel' أم 'title' في قاعدة البيانات لكي لا يظهر الاسم فارغاً
      title: map['titel'] ?? map['title'] ?? 'No Title',
      notesCount: "0",
      // ✅ الحل: نمرر لونين (اللون الأساسي + نسخة منه بشفافية مختلفة)
      colors: [mainColor, mainColor.withOpacity(0.7)],
      icon: IconData(
        int.parse(map['icon'].toString()),
        fontFamily: 'MaterialIcons',
      ),
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
