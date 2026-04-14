import 'package:bloc/bloc.dart';
import 'package:flutter_app/features/Note/Models/Recent_Note_Model.dart';
import 'package:meta/meta.dart';

part 'created_note_state.dart';

class CreatedNoteCubit extends Cubit<CreatedNoteState> {
  CreatedNoteCubit() : super(CreatedNoteInitial());
}
