// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/core/Components/custom_elevatedbutton.dart';
import 'package:flutter_app/features/Add_New_Folder/View_Models/cubit/new_folder_cubit.dart';
import 'package:flutter_app/features/Add_New_Folder/Views/widget/custom_AppBar.dart';
import 'package:flutter_app/features/Details_folder/Model/details_Note_Model.dart';
import 'package:flutter_app/features/Add_New_Folder/View_Models/Data_Colors.dart';
import 'package:flutter_app/features/Add_New_Folder/View_Models/Data_Icons.dart';
import 'package:flutter_app/features/auth/views/widgets/custom_Text.dart';
import 'package:flutter_app/features/auth/views/widgets/custom_text_Field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class New_Folder extends StatefulWidget {
  const New_Folder({super.key});

  @override
  State<New_Folder> createState() => _New_FolderState();
}

class _New_FolderState extends State<New_Folder> {
  TextEditingController text_Controller = TextEditingController();
  TextEditingController icon_Controller = TextEditingController();
  TextEditingController color_Controller = TextEditingController();
  int selectedColorIndex = 0;
  int selectedIconIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 253, 253),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            custom_AppBar(),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 242, 242),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),

                      custom_Text(
                        text: 'Folder Name',
                        fontSize: 25,
                        color: Colors.black,
                      ),
                      SizedBox(height: 10),
                      custom_Text_Field(
                        controller: text_Controller,
                        hintText: 'Work Projects',
                        obscureText: false,
                      ),
                      SizedBox(height: 25),
                      custom_Text(
                        text: 'Choose Color',
                        fontSize: 25,
                        color: Colors.black,
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        children: List.generate(myColors.length, (index) {
                          return GestureDetector(
                            onTap: () =>
                                setState(() => selectedColorIndex = index),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: myColors[index],
                                borderRadius: BorderRadius.circular(10),
                                border: selectedColorIndex == index
                                    ? Border.all(
                                        color: Colors.blueAccent,
                                        width: 4,
                                        strokeAlign: 1,
                                      ) // إطار خارجي للمختار
                                    : null,
                              ),
                              child: selectedColorIndex == index
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ) // علامة الصح
                                  : null,
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 25),
                      custom_Text(
                        text: 'Choose Color',
                        fontSize: 25,
                        color: Colors.black,
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        children: List.generate(myIcons.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIconIndex = index;
                              });
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: selectedIconIndex == index
                                    ? Border.all(
                                        color: Colors.blueAccent,
                                        width: 4,
                                        strokeAlign: 1,
                                      ) // إطار خارجي للمختار
                                    : null,
                              ),
                              child: Icon(
                                myIcons[index],
                                color: myColors[index],
                                size: 50,
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 25),
                      BlocBuilder<NewFolderCubit, NewFolderState>(
                        builder: (context, state) {
                          return custom_elevatedbutton(
                            text: 'Create Folder',
                            onpressed: () {
                              () {
                                if (text_Controller.text.isNotEmpty) {
                                  // 1. إنشاء كائن المجلد الجديد بالبيانات المختارة
                                  FolderModel folder = FolderModel(
                                    title: text_Controller.text.trim(),
                                    notesCount: "0",
                                    colors: [
                                      myColors[selectedColorIndex],
                                    ], // نمرر اللون المختار في قائمة
                                    icon: myIcons[selectedIconIndex],
                                  );

                                  // 2. إرسال الكائن للكيوبيت

                                  // 3. العودة للصفحة السابقة
                                  Navigator.pop(context);
                                } else {
                                  // إظهار تنبيه لو الاسم فارغ
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Please enter a folder name",
                                      ),
                                    ),
                                  );
                                }
                              };
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
