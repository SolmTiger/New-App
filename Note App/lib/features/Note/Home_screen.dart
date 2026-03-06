// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/App_Colors.dart';
import 'package:flutter_app/features/Note/View_Model/home_view_model.dart';
import 'package:flutter_app/features/Note/views/widget/custom_Icon_Botton_Note.dart';
import 'package:flutter_app/features/auth/views/screens/Sign%20in_screen.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = HomeViewModel();

    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon_Button(icon: const Icon(Icons.list_rounded)),
                    const Text(
                      "My Folders",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon_Button(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      ),
                      icon: Image.asset('assets/images/notifications.png'),
                    ),
                  ],
                ),
              ),

              // 2. شريط البحث (Search Bar)
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
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
                        prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                        suffixIcon: Icon(
                          Icons.mic_none_rounded,
                          size: 30,
                          color: Colors.grey[600],
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),

              // 3. زر إنشاء مجلد جديد
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: Colors.blue, size: 28),
                      SizedBox(width: 10),
                      Text(
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
              SizedBox(height: 20),
              SizedBox(
                height: 250,
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: viewModel.folders.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio:
                        0.5, // يتحكم في طول وعرض الكارت ليناسب صفين
                  ),
                  itemBuilder: (context, index) {
                    final folder = viewModel.folders[index];
                    return Container(
                      width: 140, // عرض الكارت
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: folder.colors,
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            folder.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                folder.notesCount,
                                style: const TextStyle(color: Colors.white70),
                              ),
                              Icon(
                                folder.icon,
                                color: Colors.white70,
                                size: 18,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // 5. Recent Notes Header
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Notes",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("View All", style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),

              // 6. Recent Notes List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: viewModel.recentNotes.length,
                itemBuilder: (context, index) {
                  final note = viewModel.recentNotes[index];
                  return Card(
                    elevation: 0,
                    color: Colors.grey[100],
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      leading: Container(
                        width: 4,
                        height: 40,
                        color: note.color,
                      ),
                      title: Text(
                        note.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(note.category),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.more_vert, size: 20),
                          Text(
                            note.date,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
