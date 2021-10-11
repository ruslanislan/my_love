import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyText2 extends StatelessWidget {
  const BodyText2({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
