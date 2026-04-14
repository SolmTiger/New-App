part of 'created_note_cubit.dart';

@immutable
sealed class CreatedNoteState {}

final class CreatedNoteInitial extends CreatedNoteState {}

final class CreatedNoteLoading extends CreatedNoteState {}

final class CreatedNoteSuccess extends CreatedNoteState {
  final Recent_NoteModel note;

  CreatedNoteSuccess(this.note);
}

final class CreatedNoteFailure extends CreatedNoteState {
  final String errorMessage;

  CreatedNoteFailure(this.errorMessage);
}
