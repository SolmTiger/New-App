import 'package:flutter/material.dart';
import 'package:flutter_app/features/Note/Models/Recent_Note_Model.dart';

class ViewModelNote {
  final List<Recent_NoteModel> recentNotes = [
    Recent_NoteModel(
      id: '1',
      title: "Shopping List",
      category: "Personal",
      date: "Today",
      color: Colors.red,
      FolderId: '',
    ),
  ];
}
