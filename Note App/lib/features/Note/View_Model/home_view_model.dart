import 'package:flutter/material.dart';
import 'package:flutter_app/features/Note/Models/Note_Model.dart';
import 'package:flutter_app/features/Note/Models/folder_model.dart';

class HomeViewModel {
  // قائمة المجلدات كما تظهر في التصميم
  final List<FolderModel> folders = [
    FolderModel(
      title: "Personal",
      notesCount: "12 Notes",
      colors: [
        const Color.fromARGB(255, 133, 163, 247),
        const Color.fromARGB(255, 17, 2, 118),
      ],
      icon: Icons.person,
    ),

    FolderModel(
      title: "Work",
      notesCount: "8 Notes",
      colors: [
        const Color.fromARGB(255, 137, 205, 141),
        const Color.fromARGB(255, 39, 147, 44),
      ],
      icon: Icons.work,
    ),
    FolderModel(
      title: "Study",
      notesCount: "15 Notes",
      colors: [
        const Color.fromARGB(255, 190, 92, 207),
        const Color.fromARGB(255, 115, 34, 150),
      ],
      icon: Icons.book,
    ),
    FolderModel(
      title: "Ideas",
      notesCount: "6 Notes",
      colors: [
        const Color.fromARGB(255, 187, 131, 47),
        const Color(0xFFF57C00),
      ],
      icon: Icons.lightbulb_outline,
    ),
  ];

  final List<NoteModel> recentNotes = [
    NoteModel(
      title: "Shopping List",
      category: "Personal",
      date: "Today",
      color: Colors.red,
    ),
    NoteModel(
      title: "Meeting Summary",
      category: "Work",
      date: "Yesterday",
      color: Colors.green,
    ),
    NoteModel(
      title: "Lecture 5",
      category: "Study",
      date: "2 days ago",
      color: Colors.purple,
    ),
  ];
}
