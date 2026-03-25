import 'package:flutter/material.dart';
import 'package:flutter_app/features/Details_folder/Model/details_Note_Model.dart';

class AllNotesByCategory {
  final List<Detail_note> notes = [
    Detail_note(
      Category: "HomeWork",
      DateTime: "3/5/2026",
      content: "Task Devolper app done and go to sleep",
      color: Colors.red,
    ),

    Detail_note(
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

      title: 'Personal',
      notesCount: '12',
      colors: [
        const Color.fromARGB(255, 133, 163, 247),
        const Color.fromARGB(255, 17, 2, 118),
      ],
    ),
  ];
}
