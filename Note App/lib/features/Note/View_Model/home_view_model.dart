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
        const Color.fromARGB(255, 76, 100, 165),
        const Color.fromARGB(255, 17, 2, 118),
      ],
    ),

    FolderModel(
      title: "Work",
      notesCount: "8 Notes",
      colors: [const Color(0xFF66BB6A), const Color(0xFF388E3C)],
    ),
    FolderModel(
      title: "Study",
      notesCount: "15 Notes",
      colors: [const Color(0xFFAB47BC), const Color(0xFF7B1FA2)],
    ),
    FolderModel(
      title: "Ideas",
      notesCount: "6 Notes",
      colors: [const Color(0xFFFFA726), const Color(0xFFF57C00)],
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
