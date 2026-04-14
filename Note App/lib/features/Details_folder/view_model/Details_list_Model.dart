import 'package:flutter/material.dart';
import 'package:flutter_app/features/Details_folder/Model/details_Note_Model.dart';
import 'package:flutter_app/features/Note/Models/folder_model.dart';

class AllNotesByCategory {
  final List<Detail_note_Model> notes = [
    Detail_note_Model(
      Category: "HomeWork",
      DateTime: "3/5/2026",
      content: "Task Devolper app done and go to sleep",
      color: Colors.red,
    ),

    Detail_note_Model(
      Category: "network task",
      DateTime: "4/5/2026",
      content: " take packet task .000000000000000000",
      color: Colors.green,
    ),
  ];
}

class folderData {
  final List<FolderModel> foldersData = [
    FolderModel(
      id: DateTime.now().toString(),

      title: "personal",
      icon: Icons.person,
      notesCount: '12',
      colors: [
        const Color.fromARGB(255, 22, 16, 181),
        const Color.fromARGB(255, 22, 16, 181).withOpacity(0.7),
      ],
    ),
  ];
}
