import 'package:flutter_app/features/Note/Models/folder_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'new_folder_state.dart';

class NewFolderCubit extends Cubit<NewFolderState> {
  final _supabase = Supabase.instance.client;
  List<FolderModel> allFolders = [];

  NewFolderCubit() : super(NewFolderInitial());

  Future<void> fetchFolders() async {
    try {
      emit(NewFolderLoading());
      final data = await _supabase.from('Folder').select().order('created_at');

      allFolders = (data as List)
          .map((json) => FolderModel.fromMap(json))
          .toList();

      emit(NewFolderSuccess(folders: List.from(allFolders)));
    } catch (e) {
      emit(NewFolderError(message: "Error fetching: ${e.toString()}"));
    }
  }

  void addFolder({required FolderModel newFolder}) async {
    try {
      emit(NewFolderLoading());

      // 1. الحفظ في سوبابيز
      await _supabase.from('Folder').insert({
        'titel': newFolder.title,
        'icon': newFolder.icon.codePoint
            .toString(), // شيلنا الـ ? للتأكد من وجود قيمة
        'color': newFolder.colors[0].value,
      });

      // 2. بدل ما تضيف يدوي، اسحب الداتا كاملة بالـ IDs الجديدة
      await fetchFolders();
    } catch (e) {
      emit(NewFolderError(message: "Failed to add folder: ${e.toString()}"));
    }
  }

  void deleteFolder(String id) async {
    try {
      // تحويل الـ id لـ int لأن نوعه في الجدول int8
      await _supabase.from('Folder').delete().match({'id': int.parse(id)});

      // تحديث الواجهة بعد المسح
      await fetchFolders();
    } catch (e) {
      emit(NewFolderError(message: "Delete failed: ${e.toString()}"));
    }
  }
}
