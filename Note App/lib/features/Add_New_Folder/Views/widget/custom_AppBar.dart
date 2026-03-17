import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/features/Details_folder/view/widgets/Text_Category.dart';

class custom_AppBar extends StatelessWidget {
  const custom_AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, size: 35),
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
    );
  }
}
