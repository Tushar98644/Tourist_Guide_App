import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class APPtext extends StatelessWidget {
  final String text;
  double size;
  final Color color;

  APPtext(
      {Key? key,
      required this.text,
      this.size = 26,
      this.color = Colors.black54})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size),
    );
  }
}
