import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_love/screens/new_note_screen.dart';
import 'package:my_love/widgets/eight_height_divider.dart';
import 'package:my_love/widgets/header_text_6.dart';
import 'package:my_love/widgets/note_container.dart';

class NoteScreen extends StatelessWidget {
  NoteScreen({Key? key}) : super(key: key);

  final List<Note> notes = [
    Note(
      "First flowers",
      "30 Jan 2021",
    ),
    Note(
      "Perfect date",
      "30 Jan 2021",
    ),
    Note(
      "Meeting parent",
      "30 Jan 2021",
    ),
  ];

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
        child: Column(
          children: [
            SizedBox(
              height: 44.h,
            ),
            Container(
              width: 375.w,
              height: 56.h,
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 16.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: SvgPicture.asset(
                        "assets/icons/arrow.svg",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 215.w,
                    height: 24.h,
                    child: Center(
                      child: Text(
                        "Notes",
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => NewNoteScreen(),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: SvgPicture.asset(
                        'assets/icons/add.svg',
                      ),
                    ),
                  )
                ],
              ),
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
                                    builder: (_) => NewNoteScreen(
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
        ),
      ),
    );
  }
}

class Note {
  final String name;
  final String title;

  Note(this.name, this.title);
}
