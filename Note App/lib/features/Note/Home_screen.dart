// ignore_for_file: file_names, unnecessary_type_check
import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/App_Colors.dart';
import 'package:flutter_app/features/Add_New_Folder/View_Models/cubit/new_folder_cubit.dart';
import 'package:flutter_app/features/Note/View_Model/View_Note_Model.dart';
// تم الاستغناء عن ViewModelFolder لأنه تم استبداله بالـ Cubit
import 'package:flutter_app/features/Note/views/widgets/elevatedButton_details.dart';
import 'package:flutter_app/features/Note/views/widgets/search_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. جلب البيانات من Supabase فور بناء الواجهة
    context.read<NewFolderCubit>().fetchFolders();

    final ViewModelNote noteModel = ViewModelNote();

    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          // ميزة إضافية: سحب الشاشة لتحميل البيانات مرة أخرى
          onRefresh: () => context.read<NewFolderCubit>().fetchFolders(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 10),
                // 2. تأكد أن AppBar() هو ويدجت مخصص عندك وليس AppBar الافتراضي
                AppBar(),
                Search_Field(),
                elevatedButton_details(),

                const SizedBox(height: 20),

                // 3. الجزء الخاص بعرض المجلدات من الـ Cubit
                SizedBox(
                  height: 250,
                  child: BlocBuilder<NewFolderCubit, NewFolderState>(
                    builder: (context, state) {
                      if (state is NewFolderLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is NewFolderError) {
                        return Center(child: Text(state.message));
                      }

                      if (state is NewFolderSuccess) {
                        final folders = state.folders;

                        if (folders.isEmpty) {
                          return const Center(
                            child: Text(
                              "No folders added yet",
                              style: TextStyle(color: Colors.grey),
                            ),
                          );
                        }

                        return GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          scrollDirection: Axis.horizontal,
                          itemCount: folders.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                                childAspectRatio:
                                    0.6, // تعديل بسيط لتناسب التصميم
                              ),
                          itemBuilder: (context, index) {
                            final folder = folders[index];
                            return Container(
                              width: 150,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    folder.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          22, // تقليل الحجم قليلاً ليتناسب مع الكارت
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${folder.notesCount} Notes",
                                        style: const TextStyle(
                                          color: Colors.white60,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Icon(
                                        folder.icon,
                                        color: Colors.white70,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),

                // 4. Recent Notes Header
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

                // 5. Recent Notes List
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: noteModel.recentNotes.length,
                  itemBuilder: (context, index) {
                    final note = noteModel.recentNotes[index];
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
      ),
    );
  }
}
