// ignore_for_file: prefer_const_constructors, unnecessary_import, implementation_imports, must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundcolor;
  double size;
  final Color bordercolor;
  String? text;
  IconData? icon;
  bool isIcon;

  AppButtons({
    super.key,
    this.icon,
    this.text = "hi",
    this.isIcon = false,
    required this.size,
    required this.color,
    required this.backgroundcolor,
    required this.bordercolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 15),
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(
            color: bordercolor,
          ),
          borderRadius: BorderRadius.circular(15),
          color: backgroundcolor,
        ),
        child: isIcon == false
            ? Center(child: APPtext(text: text!, color: color))
            : Center(
                child: Icon(
                  icon,
                  color: color,
                ),
              ));
  }
}
