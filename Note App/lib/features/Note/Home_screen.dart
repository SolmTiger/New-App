import 'package:flutter/material.dart';
import 'package:flutter_app/features/Note/widget/custom_Icon_Botton_Note.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Icon_Button(icon: Icon(Icons.list_rounded)),
                      Text(
                        "My Folders",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset('/assets/icons/image 7.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white10, // لون الخلفية
                      borderRadius: BorderRadius.circular(
                        30,
                      ), // الحواف الدائرية من الصورة
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.01),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(0, 5), // الظل السفلي
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search...",
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 18,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey[600],
                          ),
                          suffixIcon: Icon(
                            Icons.mic_none_rounded,
                            size: 35,
                            color: Colors.grey[600],
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // لون الخلفية الأبيض
                      foregroundColor: Colors.black, // لون النص
                      elevation: 20, // قوة الظل الخفيف
                      shadowColor: Colors.black.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          25,
                        ), // الحواف الدائرية الكبيرة
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10,
                      ),
                    ),
                    child: Row(
                      mainAxisSize:
                          MainAxisSize.max, // لجعل الزر يأخذ مساحة المحتوى فقط
                      children: [
                        const Icon(
                          Icons.add,
                          color: Colors.blue, // لون الزائد الأزرق
                          size: 28,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Create New Folder",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
