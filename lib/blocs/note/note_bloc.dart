import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_love/models/note.dart';
import 'package:my_love/services/note_service.dart';

part 'note_event.dart';

part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteService _noteService;

  NoteBloc(this._noteService) : super(NotesLoading()) {
    on<LoadNotes>((event, emit) async {
      emit(NotesLoading());
      final List<Note> list = await _noteService.getAll();
      emit(NotesLoaded(list));
    });
    on<CreateNote>((event, emit) async {
      await _noteService.create(event.note);
      emit(NotesLoading());
      final List<Note> list = await _noteService.getAll();
      emit(NotesLoaded(list));
    });
    on<UpdateNote>((event, emit) async {
      await _noteService.update(event.note);
      emit(NotesLoading());
      final List<Note> list = await _noteService.getAll();
      emit(NotesLoaded(list));
    });
  }
}
