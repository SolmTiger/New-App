import 'package:flutter/material.dart';
import 'package:flutter_app/features/Note/Models/Note_Model.dart';

class ViewModelNote {
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
