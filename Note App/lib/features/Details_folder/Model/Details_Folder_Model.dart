import 'dart:ui';

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
    required String id,
  });
}
