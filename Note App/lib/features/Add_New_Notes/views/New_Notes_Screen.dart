import 'package:flutter/material.dart';
import 'package:flutter_app/core/Components/Text_Field.dart';
import 'package:flutter_app/core/Components/custom_elevatedbutton.dart';
import 'package:flutter_app/core/utils/App_Colors.dart';
import 'package:flutter_app/features/Add_New_Notes/views/widgets/Content_Details.dart';
import 'package:flutter_app/features/Add_New_Notes/views/widgets/custom_AppBar.dart';
import 'package:flutter_app/features/Details_folder/view/widgets/Text_Category.dart';
import 'package:flutter_quill/flutter_quill.dart';

class New_Notes extends StatefulWidget {
  const New_Notes({super.key});

  @override
  State<New_Notes> createState() => _New_NotesState();
}

class _New_NotesState extends State<New_Notes> {
  final QuillController _controller = QuillController.basic();
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
                    SizedBox(height: 20),
                    //الجزء الخاص  appbar
                    //
                    Custom_AppBar(),
                    SizedBox(height: 10),
                    Divider(color: Colors.grey, thickness: 2, height: 10),
                    SizedBox(height: 10),
                    Text_field(text: 'Titel:'),
                    SizedBox(height: 10),
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
                    SizedBox(height: 30),
                    Text_field(text: 'Content:'),
                    Custom_contentDetails(controller: _controller),
                    SizedBox(height: 20),
                    Text_Category(text: 'Folders:"'),
                    SizedBox(height: 10),
                    //الجزء الخاص ب ال folder
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIconConstraints: (BoxConstraints(minWidth: 70)),
                        prefixIcon: Icon(
                          Icons.folder_outlined,
                          size: 40,
                          color: const Color.fromARGB(255, 64, 20, 117),
                        ),

                        hintText: 'Personal',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20),
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
                    SizedBox(height: 40),
                    custom_elevatedbutton(
                      onpressed: () {},
                      text: 'Save Note',
                      backgroundColor: const Color.fromARGB(255, 61, 114, 207),
                    ),
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
