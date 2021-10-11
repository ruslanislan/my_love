import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_love/widgets/custom_app_bar.dart';
import 'package:my_love/widgets/eight_height_divider.dart';
import 'package:my_love/widgets/ok_button.dart';

import 'note_screen.dart';

class NewNoteScreen extends StatefulWidget {
  const NewNoteScreen({Key? key, this.note}) : super(key: key);
  final Note? note;

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  final TextEditingController textEditingController1 = TextEditingController();

  final TextEditingController textEditingController2 = TextEditingController();

  final TextEditingController textEditingController3 = TextEditingController();

  bool isNotEmptyText1 = false;
  bool isNotEmptyText2 = false;
  bool isNotEmptyText3 = false;

  @override
  void initState() {
    if (widget.note != null) {
      textEditingController1.text = widget.note!.name;
      textEditingController2.text = widget.note!.title;
    }
    textEditingController1.addListener(() {
      if (textEditingController1.text.isNotEmpty) {
        isNotEmptyText1 = true;
      }
      if (isNotEmptyText1 && isNotEmptyText2 && isNotEmptyText3) {
        setState(() {});
      }
    });
    textEditingController2.addListener(() {
      if (textEditingController2.text.isNotEmpty) {
        isNotEmptyText2 = true;
      }
      if (isNotEmptyText1 && isNotEmptyText2 && isNotEmptyText3) {
        setState(() {});
      }
    });
    textEditingController3.addListener(() {
      if (textEditingController3.text.isNotEmpty) {
        isNotEmptyText3 = true;
      }
      if (isNotEmptyText1 && isNotEmptyText2 && isNotEmptyText3) {
        setState(() {});
      }
    });

    super.initState();
  }

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
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 44.h,
                ),
                CustomAppBar(
                  text: widget.note == null ? "New note" : "Note",
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const EightHeightDivider(),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          width: 327.w,
                          height: 340.h,
                          child: Column(
                            children: [
                              _TextBlock(
                                textEditingController: textEditingController1,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                                labelText: 'Add name...',
                                name: 'Name',
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              _TextBlock(
                                textEditingController: textEditingController2,
                                style: Theme.of(context).textTheme.headline6,
                                textInputType: TextInputType.number,
                                labelText: 'Add a date...',
                                name: 'Date',
                                mode: 2,
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              _TextBlock(
                                height: 124.h,
                                textEditingController: textEditingController3,
                                style: Theme.of(context).textTheme.headline6,
                                labelText: 'Add a note...',
                                name: 'Note',
                                last: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 666.h,
              left: 152.5.w,
              child: OkButton(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextBlock extends StatefulWidget {
  const _TextBlock(
      {Key? key, this.height, required this.textEditingController, this.style, this.textInputType, required this.name, required this.labelText, this.last = false, this.mode = 0})
      : super(key: key);
  final double? height;
  final TextEditingController textEditingController;
  final TextStyle? style;
  final TextInputType? textInputType;
  final String name;
  final String labelText;
  final bool last;
  final int mode;

  @override
  State<_TextBlock> createState() => _TextBlockState();
}

class _TextBlockState extends State<_TextBlock> {
  bool editing = false;
  final FocusNode focusNode = FocusNode();
  int textLength = 0;

  @override
  void initState() {
    textLength = widget.textEditingController.text.length;
    if (textLength != 0) {
      editing = true;
    }
    focusNode.addListener(() async {
      if (!focusNode.hasFocus && textLength == 0) {
        editing = false;
        setState(() {});
      }
    });
    super.initState();
  }

  void setFocus() {
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 327.w,
          height: 16.h,
          child: Center(
            child: Text(
              widget.name,
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        Container(
          width: 327.w,
          height: widget.height ?? 43.h,
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 8.h,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF252525).withAlpha(80),
            borderRadius: BorderRadius.circular(
              17.r,
            ),
          ),
          child: Stack(
            children: [
              SizedBox(
                width: 295.w,
                height: 27.h,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    editing ? "" : widget.labelText,
                    style: widget.style ??
                        TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              TextField(
                focusNode: focusNode,
                maxLines: widget.height == null ? 1 : 5,
                controller: widget.textEditingController,
                onTap: () {
                  editing = true;
                  setState(() {});
                },
                onEditingComplete: () {
                  if (widget.textEditingController.text.isEmpty) {
                    editing = false;
                    setState(() {});
                  }
                  if (!widget.last) {
                    FocusScope.of(context).nextFocus();
                  } else {
                    FocusScope.of(context).unfocus();
                  }
                },
                onChanged: (value) {
                  if (widget.mode == 1) {
                    if (value.length >= 5) {
                      widget.textEditingController.text = value.substring(0, 5);
                      widget.textEditingController.selection = TextSelection.fromPosition(
                        TextPosition(offset: widget.textEditingController.text.length),
                      );
                    } else if (value.length == 2 && textLength < value.length) {
                      widget.textEditingController.text += ":";
                      widget.textEditingController.selection = TextSelection.fromPosition(
                        TextPosition(offset: widget.textEditingController.text.length),
                      );
                    } else if (textLength > value.length && value.length == 2) {
                      widget.textEditingController.text = widget.textEditingController.text.substring(0, 1);
                      widget.textEditingController.selection = TextSelection.fromPosition(
                        TextPosition(offset: widget.textEditingController.text.length),
                      );
                    }
                  } else if (widget.mode == 2) {
                    if (value.length >= 10) {
                      widget.textEditingController.text = value.substring(0, 10);
                      widget.textEditingController.selection = TextSelection.fromPosition(
                        TextPosition(offset: widget.textEditingController.text.length),
                      );
                    } else if ((value.length == 2 || value.length == 5) && textLength < value.length) {
                      widget.textEditingController.text += ".";
                      widget.textEditingController.selection = TextSelection.fromPosition(
                        TextPosition(offset: widget.textEditingController.text.length),
                      );
                    } else if (textLength > value.length && (value.length == 2 || value.length == 5)) {
                      if (value.length == 2) {
                        widget.textEditingController.text = widget.textEditingController.text.substring(0, 1);
                      } else {
                        widget.textEditingController.text = widget.textEditingController.text.substring(0, 4);
                      }
                      widget.textEditingController.selection = TextSelection.fromPosition(
                        TextPosition(offset: widget.textEditingController.text.length),
                      );
                    }
                  }
                  textLength = widget.textEditingController.text.length;
                },
                keyboardType: widget.textInputType ?? TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: widget.height == null ? null : EdgeInsets.zero,
                ),
                style: widget.style ??
                    TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
