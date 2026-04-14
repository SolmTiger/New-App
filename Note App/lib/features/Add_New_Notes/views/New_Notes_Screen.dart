import 'package:flutter/material.dart';
import 'package:flutter_app/features/Add_New_Folder/View_Models/cubit/new_folder_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // تأكد من إضافة هذا السطر
import 'package:flutter_app/core/Components/Text_Field.dart';
import 'package:flutter_app/core/Components/custom_elevatedbutton.dart';
import 'package:flutter_app/core/utils/App_Colors.dart';
import 'package:flutter_app/features/Add_New_Notes/views/widgets/Content_Details.dart';
import 'package:flutter_app/features/Add_New_Notes/views/widgets/custom_AppBar.dart';
import 'package:flutter_app/features/Details_folder/view/widgets/Text_Category.dart';
// استيراد الـ Cubit الخاص بك (عدل المسار حسب مشروعك)
// import 'package:flutter_app/features/Note/view_model/new_folder_cubit.dart';
import 'package:flutter_quill/flutter_quill.dart';

class New_Notes extends StatefulWidget {
  const New_Notes({super.key});

  @override
  State<New_Notes> createState() => _New_NotesState();
}

class _New_NotesState extends State<New_Notes> {
  final QuillController _controller = QuillController.basic();

  // --- التعديل: تعريف المتحكمات للمجلد المختار ---
  final TextEditingController _folderController = TextEditingController();
  String? _selectedFolderId;

  // --- التعديل: دالة عرض قائمة المجلدات ---
  void _showFolderList(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        // نستخدم BlocBuilder لعرض البيانات الحقيقية من سوبابيز
        return BlocBuilder<NewFolderCubit, NewFolderState>(
          builder: (context, state) {
            if (state is NewFolderSuccess) {
              return ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(15),
                itemCount: state.folders.length,
                itemBuilder: (context, index) {
                  final folder = state.folders[index];
                  return ListTile(
                    leading: Icon(folder.icon, color: folder.colors[0]),
                    title: Text(folder.title),
                    onTap: () {
                      setState(() {
                        _folderController.text =
                            folder.title; // عرض الاسم في الحقل
                        _selectedFolderId = folder.id; // تخزين الـ ID للحفظ
                      });
                      Navigator.pop(context); // إغلاق القائمة
                    },
                  );
                },
              );
            } else if (state is NewFolderLoading) {
              return const SizedBox(
                height: 200,
                child: Center(child: CircularProgressIndicator()),
              );
            } else {
              return const SizedBox(
                height: 200,
                child: Center(child: Text("No folders found")),
              );
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: AppColors.kBackgroundColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Custom_AppBar(),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.grey, thickness: 2, height: 10),
                    const SizedBox(height: 10),
                    const Text_field(text: 'Title:'),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text_field(text: 'Content:'),
                    Custom_contentDetails(controller: _controller),
                    const SizedBox(height: 20),
                    const Text_Category(text: 'Folders:'),
                    const SizedBox(height: 10),

                    // --- التعديل: حقل المجلدات الذي يفتح القائمة ---
                    TextFormField(
                      controller: _folderController, // ربط المتحكم
                      readOnly: true, // منع الكيبورد
                      onTap: () =>
                          _showFolderList(context), // فتح القائمة عند الضغط
                      decoration: InputDecoration(
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 70,
                        ),
                        prefixIcon: const Icon(
                          Icons.folder_outlined,
                          size: 40,
                          color: Color.fromARGB(255, 64, 20, 117),
                        ),
                        hintText: 'Select Folder',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        suffixIcon: const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(Icons.keyboard_arrow_down, size: 40),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.blueAccent,
                            width: 2,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                    custom_elevatedbutton(
                      onpressed: () {
                        // هنا يمكنك استخدام _selectedFolderId لإرساله مع النوتة لـ Supabase
                        print("Saving note to folder: $_selectedFolderId");
                      },
                      text: 'Save Note',
                      backgroundColor: const Color.fromARGB(255, 61, 114, 207),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
