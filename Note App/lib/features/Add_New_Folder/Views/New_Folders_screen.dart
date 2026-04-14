import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/Components/custom_elevatedbutton.dart';
import 'package:flutter_app/features/Add_New_Folder/View_Models/cubit/new_folder_cubit.dart';
import 'package:flutter_app/features/Add_New_Folder/Views/widget/custom_AppBar.dart';
import 'package:flutter_app/features/Note/Models/folder_model.dart';
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
  int selectedColorIndex = 0;
  int selectedIconIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 253, 253),
      body: SingleChildScrollView(
        // أضفت SingleChildScrollView عشان الكيبورد ما تعملش مشكلة
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              custom_AppBar(),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 246, 242, 242),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        custom_Text(
                          text: 'Folder Name',
                          fontSize: 25,
                          color: Colors.black,
                        ),
                        const SizedBox(height: 10),
                        custom_Text_Field(
                          controller: text_Controller,
                          hintText: 'Work Projects',
                          obscureText: false,
                        ),
                        const SizedBox(height: 25),
                        custom_Text(
                          text: 'Choose Color',
                          fontSize: 25,
                          color: Colors.black,
                        ),
                        const SizedBox(height: 10),
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
                                        )
                                      : null,
                                ),
                                child: selectedColorIndex == index
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 25),
                        // تم تغيير النص هنا لـ Choose Icon
                        custom_Text(
                          text: 'Choose Icon',
                          fontSize: 25,
                          color: Colors.black,
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 10,
                          children: List.generate(myIcons.length, (index) {
                            return GestureDetector(
                              onTap: () =>
                                  setState(() => selectedIconIndex = index),
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
                                        )
                                      : null,
                                ),
                                child: Icon(
                                  myIcons[index],
                                  // جعلنا الأيقونة تتبع اللون المختار
                                  color: myColors[selectedColorIndex],
                                  size: 30,
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 35),
                        BlocBuilder<NewFolderCubit, NewFolderState>(
                          builder: (context, state) {
                            return custom_elevatedbutton(
                              text: 'Create Folder',
                              onpressed: () {
                                log(
                                  "Create button pressed with folder name: ${text_Controller.text}",
                                );
                                if (text_Controller.text.isNotEmpty) {
                                  final folder = FolderModel(
                                    id: DateTime.now().toIso8601String(),
                                    title: text_Controller.text.trim(),
                                    notesCount: "0",
                                    colors: [myColors[selectedColorIndex]],
                                    icon: myIcons[selectedIconIndex],
                                  );

                                  context.read<NewFolderCubit>().addFolder(
                                    newFolder: folder,
                                  );
                                  Navigator.pop(context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Please enter a folder name",
                                      ),
                                    ),
                                  );
                                }
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
      ),
    );
  }
}
