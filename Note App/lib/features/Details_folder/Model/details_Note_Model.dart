// ignore_for_file: file_names, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';

class FolderModel {
  final String title;
  final String notesCount;
  final List<Color> colors;
  final IconData? icon;

  var id;

  FolderModel({
    required this.title,
    required this.notesCount,
    required this.colors,
    this.icon,
  });
}

class Detail_note {
  final String Category;
  final String content;
  final String DateTime;
  final Color color;

  Detail_note({
    required this.Category,
    required this.content,
    required this.DateTime,
    required this.color,
  });
}
