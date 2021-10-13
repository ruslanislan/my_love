part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NotesLoading extends NoteState{

}

class NotesLoaded extends NoteState{
  final List<Note> list;

  NotesLoaded(this.list);
  @override
  List<Object?> get props => [list];
}