// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_app/features/Details_folder_screen/view/widgets/Text_Category.dart';
import 'package:flutter_app/features/Details_folder_screen/view_model/Details_list_Model.dart';
import 'package:flutter_app/features/Note/Models/folder_model.dart';
import 'package:flutter_app/features/auth/views/screens/Sign%20in_screen.dart';

class Folder_Screen extends StatelessWidget {
  final AllNotesByCategory viewModel = AllNotesByCategory();
  final folderData data = folderData();

  Folder_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 234, 234),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 20),
            //الجزء الخاص  appbar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  icon: Icon(Icons.arrow_back, size: 35),
                ),
                Text_Category(
                  text: 'personal',
                  color: const Color.fromARGB(255, 22, 16, 181),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert, size: 35),
                ),
              ],
            ),
            // الجزي الخاص  containar الكبير
            Container(
              width: 350,
              height: 208, // عرض الكارت
              child: Column(
                children: [
                  SizedBox(height: 20),

                  Row(
                    children: [
                      SizedBox(width: 20),
                      Image.asset('assets/images/folder.png'),
                      SizedBox(width: 25),
                      Column(
                        children: [
                          SizedBox(height: 40),
                          Text_Category(text: 'Personal', color: Colors.white),
                          Text(
                            '12 Notes',
                            style: TextStyle(color: Colors.white70),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 50,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, color: Colors.blue),
                            SizedBox(width: 5),
                            Text(
                              "Add New Note",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: data.foldersData[0].colors,
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: viewModel.notes.length,
              itemBuilder: (context, index) {
                final notes = viewModel.notes[index];
                return Card(
                  elevation: 10,
                  color: Colors.grey[100],
                  margin: const EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ListTile(
                    isThreeLine: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 10,
                    ),
                    leading: Container(
                      width: 6,
                      height: 80,
                      color: notes.color,
                    ),
                    title: Text(
                      notes.Category,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notes.content,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 15),
                        ),
                        Text(
                          notes.DateTime,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),

                    trailing: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [const Icon(Icons.more_vert, size: 20)],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
