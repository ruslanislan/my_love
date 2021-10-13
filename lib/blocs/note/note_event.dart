part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadNotes extends NoteEvent{

}

class CreateNote extends NoteEvent{
  final Note note;

  CreateNote(this.note);
}

class UpdateNote extends NoteEvent{
  final Note note;

  UpdateNote(this.note);
}