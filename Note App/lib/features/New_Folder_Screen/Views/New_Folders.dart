import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/core/Components/custom_elevatedbutton.dart';
import 'package:flutter_app/features/Details_folder_screen/view/widgets/Text_Category.dart';
import 'package:flutter_app/features/New_Folder_Screen/View_Models/Data_Colors.dart';
import 'package:flutter_app/features/New_Folder_Screen/View_Models/Data_Icons.dart';
import 'package:flutter_app/features/auth/views/widgets/custom_Text.dart';
import 'package:flutter_app/features/auth/views/widgets/custom_text_Field.dart';

class New_Folder extends StatefulWidget {
  const New_Folder({super.key});

  @override
  State<New_Folder> createState() => _New_FolderState();
}

class _New_FolderState extends State<New_Folder> {
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
            Row(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, size: 35),
                    ),
                    SizedBox(width: 50),
                    Text_Category(text: 'Add New Folder', color: Colors.black),

                    SizedBox(width: 30),
                    GestureDetector(
                      onTap: () {
                        SystemSound.play(SystemSoundType.click);
                      },

                      child: Container(
                        child: Center(
                          child: Text(
                            'save',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        height: 35,
                        width: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 29, 72, 213),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
                      custom_elevatedbutton(text: 'Create Folder'),
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
