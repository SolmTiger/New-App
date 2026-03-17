import 'package:flutter/material.dart';
import 'package:flutter_app/features/Details_folder/view/widgets/Text_Category.dart';

class Custom_AppBar extends StatelessWidget {
  const Custom_AppBar({super.key});

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
              icon: Icon(Icons.arrow_back, size: 35),
            ),
            SizedBox(width: 60),
            Text_Category(text: 'Add New Note', color: Colors.black),
          ],
        ),
      ],
    );
  }
}
