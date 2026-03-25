import 'package:flutter_app/features/Details_folder/Model/details_Note_Model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_folder_state.dart';

class NewFolderCubit extends Cubit<NewFolderState> {
  NewFolderCubit() : super(NewFolderInitial());

  List<FolderModel> allFolders = [];

  // دالة لإضافة مجلد جديد
  void addFolder({required FolderModel newFolder}) {
    try {
      emit(NewFolderLoading());

      allFolders.add(newFolder);

      // نرسل نسخة جديدة من القائمة للـ UI
      emit(NewFolderSuccess(folders: List.from(allFolders)));
    } catch (e) {
      emit(NewFolderError(message: "Failed to add folder"));
    }
  }

  // دالة لمسح مجلد معين بالـ ID
  void deleteFolder(String id) {
    allFolders.removeWhere((folder) => folder.id == id);
    emit(NewFolderSuccess(folders: List.from(allFolders)));
  }
}
