import 'package:flutter/material.dart';
import 'package:flutter_app/features/Details_folder/view/widgets/Text_Category.dart';
import 'package:flutter_app/features/auth/views/widgets/custom_Text.dart';

class Notes_Details extends StatelessWidget {
  const Notes_Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                SizedBox(width: 30),
                Text_Category(
                  text: 'My Diary',
                  color: const Color.fromARGB(255, 22, 16, 181),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              ],
            ),
            SizedBox(height: 10),
            Divider(color: Colors.grey, thickness: 1),
            SizedBox(height: 20),
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            custom_Text(
              text: 'Photos',
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 217, 186, 186),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 100,
                    width: 100,
                    child: Icon(Icons.add_a_photo_rounded),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            custom_Text(
              text: 'Tags',
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 144, 56, 56),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 84, 156, 89),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
