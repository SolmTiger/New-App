import 'package:flutter/material.dart';
import 'package:flutter_app/core/Components/Text_Field.dart';
import 'package:flutter_app/core/utils/App_Colors.dart';
import 'package:flutter_app/features/Details_folder_screen/view/widgets/Text_Category.dart';

class New_Notes extends StatelessWidget {
  const New_Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back, size: 35),
                          ),
                          SizedBox(width: 100),
                          Text_Category(
                            text: 'personal',
                            color: const Color.fromARGB(255, 22, 16, 181),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(color: AppColors.kSecondaryColor, thickness: 1),
                  SizedBox(height: 10),
                  Text_field(text: 'Mat'),
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
                  SizedBox(height: 20),
                  Text_field(text: 'Centon:'),
                  Container(
                    height: 300,

                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 144, 124, 124),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
