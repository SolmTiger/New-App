import 'package:flutter_app/features/Details_folder/Model/details_Note_Model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'new_folder_state.dart';

class NewFolderCubit extends Cubit<NewFolderState> {
  final _supabase = Supabase.instance.client;

  NewFolderCubit() : super(NewFolderInitial());

  List<FolderModel> allFolders = [];

  // دالة لإضافة مجلد جديد وحفظه في السوبابيز
  void addFolder({required FolderModel newFolder}) async {
    try {
      emit(NewFolderLoading());

      // --- الإضافة الجديدة هنا (الربط مع قاعدة البيانات) ---
      await _supabase.from('Folder').insert({
        'titel': newFolder.title, // تأكد من كتابتها 'titel' كما في جدولك
        'icon': newFolder.icon?.codePoint.toString(),
        'color': newFolder.colors[0].value,
      });
      // -----------------------------------------------

      // تحديث القائمة المحلية (اختياري لو هتعمل Fetch بعدها)
      allFolders.add(newFolder);

      emit(NewFolderSuccess(folders: List.from(allFolders)));
    } catch (e) {
      // تعديل الرسالة لتظهر الخطأ الحقيقي لو حصلت مشكلة في الشبكة
      emit(NewFolderError(message: "Failed to add folder: ${e.toString()}"));
    }
  }

  // دالة لمسح مجلد معين بالـ ID
  void deleteFolder(String id) {
    allFolders.removeWhere((folder) => folder.id == id);
    emit(NewFolderSuccess(folders: List.from(allFolders)));
  }
}
