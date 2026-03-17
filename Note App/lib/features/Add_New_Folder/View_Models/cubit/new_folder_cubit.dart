import 'package:flutter_app/features/Details_folder/Model/details_Note_Model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_folder_state.dart';

class NewFolderCubit extends Cubit<NewFolderState> {
  NewFolderCubit() : super(NewFolderState(folders: []));

  List<FolderModel> allFolders = [];
}
