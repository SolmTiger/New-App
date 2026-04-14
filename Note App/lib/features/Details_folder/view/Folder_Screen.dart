// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_app/features/Add_New_Notes/views/New_Notes_Screen.dart';
import 'package:flutter_app/features/Details_folder/view/widgets/Text_Category.dart';
import 'package:flutter_app/features/Details_folder/view_model/Details_list_Model.dart';
import 'package:flutter_app/features/Note/Models/folder_model.dart';
import 'package:flutter_app/features/auth/views/screens/Sign%20in_screen.dart';

class Folder_Screen extends StatelessWidget {
  // 1. تعريف المتغير لاستقبال بيانات الفولدر المختار
  final FolderModel folder;
  final AllNotesByCategory viewModel = AllNotesByCategory();

  // 2. تحديث الـ Constructor لاستقبال المتغير وتخزينه
  Folder_Screen({super.key, required this.folder});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 234, 234),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // AppBar الديناميكي
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, size: 35),
                ),
                Text_Category(
                  text: folder.title, // 👈 عرض اسم الفولدر المختار
                  color: folder
                      .colors[0], // 👈 تلوين النص بأول لون من ألوان الفولدر
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert, size: 35),
                ),
              ],
            ),

            // الكارت الكبير (Header)
            Container(
              width: double.infinity,
              height: 208,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: folder.colors, // 👈 استخدام تدرج ألوان الفولدر
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      // استخدام الأيقونة المخزنة في الموديل
                      Icon(folder.icon, size: 80, color: Colors.white),
                      const SizedBox(width: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          Text_Category(
                            text: folder.title, // 👈 اسم الفولدر
                            color: Colors.white,
                          ),
                          Text(
                            "${folder.notesCount} Notes", // 👈 عدد الملاحظات
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  // زر إضافة نوت جديدة
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => New_Notes()),
                        );
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: folder.colors[0],
                            ), // 👈 أيقونة بلون الفولدر
                            const SizedBox(width: 5),
                            Text(
                              "Add New Note",
                              style: TextStyle(
                                color: folder.colors[0], // 👈 نص بلون الفولدر
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // قائمة الملاحظات
            Expanded(
              // 👈 استخدمنا Expanded لضمان عدم حدوث Overflow
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: viewModel.notes.length,
                itemBuilder: (context, index) {
                  final note = viewModel.notes[index];
                  return Card(
                    elevation: 5,
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      leading: Container(
                        width: 5,
                        height: 40,
                        decoration: BoxDecoration(
                          color: note.color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      title: Text(
                        note.Category,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        note.content,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                        note.DateTime,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
