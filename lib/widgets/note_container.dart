import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_love/screens/note_screen.dart';

class NoteContainer extends StatelessWidget {
  const NoteContainer({Key? key, required this.note, this.onTap}) : super(key: key);
  final Note note;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 327.w,
        height: 148.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20.r,
          ),
          color: const Color(0xFF252525).withAlpha(80),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              note.name,
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              note.title,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
