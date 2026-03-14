import 'package:flutter/material.dart';

class FolderModel {
  final String title;
  final String notesCount;
  final List<Color> colors;
  final IconData icon;

  FolderModel({
    required this.title,
    required this.notesCount,
    required this.colors,
    required this.icon,
  });
}
