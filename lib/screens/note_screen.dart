import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_love/blocs/note/note_bloc.dart';
import 'package:my_love/models/note.dart';
import 'package:my_love/screens/new_note_screen.dart';
import 'package:my_love/widgets/custom_app_bar.dart';
import 'package:my_love/widgets/eight_height_divider.dart';
import 'package:my_love/widgets/header_text_6.dart';
import 'package:my_love/widgets/note_container.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFBBC7),
                Color(0xFFFF899D),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        child: BlocBuilder<NoteBloc, NoteState>(
          builder: (context, state) {
            if(state is NotesLoading){
              return const Center(child: CircularProgressIndicator(),);
            }
            final List<Note> notes = (state as NotesLoaded).list;
            notes.map((e) => print(e.date)).toList();
            return Column(
              children: [
                SizedBox(
                  height: 44.h,
                ),
                CustomAppBar(
                  text: "Notes",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const NewNoteScreen(),
                      ),
                    );
                  },
                ),
                Expanded(
                  child: notes.isEmpty
                      ? Stack(
                    children: [
                      Positioned(
                        bottom: 426.h,
                        left: 24.w,
                        child: HeaderText6(
                          height: 22.h,
                          text: "You have no notes",
                        ),
                      )
                    ],
                  )
                      : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (_, int index) {
                      return Column(
                        children: [
                          const EightHeightDivider(),
                          NoteContainer(
                            note: notes[index],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      NewNoteScreen(
                                        note: notes[index],
                                      ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                    itemCount: notes.length,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
