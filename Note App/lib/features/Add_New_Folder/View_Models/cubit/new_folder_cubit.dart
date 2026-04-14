import 'dart:developer';
import 'package:flutter_app/features/Note/Models/folder_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'new_folder_state.dart';

class NewFolderCubit extends Cubit<NewFolderState> {
  final _supabase = Supabase.instance.client;

  // نستخدم القائمة هنا كـ Cache محلي إذا احتجنا الوصول إليها لاحقاً
  List<FolderModel> allFolders = [];

  NewFolderCubit() : super(NewFolderInitial());

  // --- 1. جلب البيانات ---
  Future<void> fetchFolders() async {
    try {
      emit(NewFolderLoading());

      // جلب البيانات من جدول Folder وترتيبها حسب الأحدث
      final List<dynamic> data = await _supabase
          .from('Folder')
          .select()
          .order('created_at', ascending: false);

      // تحويل JSON القادم من سوبابيز إلى Object Model
      allFolders = data.map((json) => FolderModel.fromMap(json)).toList();

      log("Fetched ${allFolders.length} folders successfully.");

      emit(NewFolderSuccess(folders: List.from(allFolders)));
    } catch (e) {
      log("Fetch Error: ${e.toString()}");
      emit(
        NewFolderError(message: "حدث خطأ أثناء جلب المجلدات: ${e.toString()}"),
      );
    }
  }

  // --- 2. إضافة مجلد جديد ---
  void addFolder({required FolderModel newFolder}) async {
    try {
      // نترك الواجهة في حالة تحميل أثناء الإضافة
      emit(NewFolderLoading());

      await _supabase.from('Folder').insert({
        'title': newFolder.title,
        'icon': newFolder.icon.codePoint
            .toString(), // حفظ الكود الخاص بالأيقونة
        'color': newFolder.colors[0].value, // حفظ قيمة اللون الأول
      });

      log("Folder added successfully: ${newFolder.title}");

      // ✅ استدعاء fetchFolders مباشرة لتحديث القائمة في الـ UI
      await fetchFolders();
    } catch (e) {
      log("Add folder failed: ${e.toString()}");
      emit(NewFolderError(message: "فشل في إضافة المجلد: ${e.toString()}"));
    }
  }

  // --- 3. حذف مجلد ---
  void deleteFolder(String id) async {
    try {
      // يفضل عدم عمل Loading كامل للشاشة عند الحذف لتجربة مستخدم أفضل
      // سنقوم بالحذف مباشرة من سوبابيز
      await _supabase.from('Folder').delete().match({'id': int.parse(id)});

      log("Folder deleted ID: $id");

      // ✅ تحديث الواجهة بعد المسح
      await fetchFolders();
    } catch (e) {
      log("Delete failed: ${e.toString()}");
      emit(NewFolderError(message: "فشل في حذف المجلد: ${e.toString()}"));
    }
  }
}
