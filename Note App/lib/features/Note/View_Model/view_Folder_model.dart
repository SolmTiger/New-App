import 'package:flutter/material.dart';
import 'package:flutter_app/features/Note/Models/folder_model.dart';

class ViewModelFolder {
  // قائمة المجلدات كما تظهر في التصميم
  final List<FolderModel> folders = [
    FolderModel(
      id: '1',
      title: "Personal",
      notesCount: "12 Notes",
      colors: [
        const Color.fromARGB(255, 133, 163, 247),
        const Color.fromARGB(255, 17, 2, 118),
      ],
      icon: Icons.person,
    ),

    FolderModel(
      id: '2',

      title: "Work",
      notesCount: "8 Notes",
      colors: [
        const Color.fromARGB(255, 137, 205, 141),
        const Color.fromARGB(255, 39, 147, 44),
      ],
      icon: Icons.work,
    ),
    FolderModel(
      id: '3',

      title: "Study",
      notesCount: "15 Notes",
      colors: [
        const Color.fromARGB(255, 190, 92, 207),
        const Color.fromARGB(255, 115, 34, 150),
      ],
      icon: Icons.book,
    ),
    FolderModel(
      id: '4',

      title: "Ideas",
      notesCount: "6 Notes",
      colors: [
        const Color.fromARGB(255, 187, 131, 47),
        const Color(0xFFF57C00),
      ],
      icon: Icons.lightbulb_outline,
    ),
  ];
}
