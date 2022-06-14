import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  SmallText({Key? key,
    this.color=const Color(0xFFccc7c5),
    this.size=12,
    this.height=1.2,
    required this.text,
  }) : super(key: key);
  Color? color;
  final String text;
  double size;
  double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
       style: TextStyle(color: color,
        fontFamily: 'Roboto',
        fontSize: size,
        height: height,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
