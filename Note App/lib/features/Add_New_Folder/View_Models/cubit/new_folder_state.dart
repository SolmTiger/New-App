part of 'new_folder_cubit.dart';

abstract class NewFolderState {}

class NewFolderInitial extends NewFolderState {}

class NewFolderLoading extends NewFolderState {}

class NewFolderSuccess extends NewFolderState {
  final List<FolderModel> folders; // المجلدات التي سيتم عرضها
  NewFolderSuccess({required this.folders});
}

class NewFolderError extends NewFolderState {
  final String message;
  NewFolderError({required this.message});
}
