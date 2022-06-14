import 'package:flutter/material.dart';
import 'package:hapook_food/utlis/dimensions.dart';

class BigText extends StatelessWidget {
   BigText({Key? key,
    this.color=const Color(0xFF332d2b),
    this.size=0,
    required this.text,
    this.textOverflow=TextOverflow.ellipsis,
  }) : super(key: key);
   Color? color;
  final String text;
  double size;
  TextOverflow textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1 ,
      overflow: textOverflow,
      style: TextStyle(color: color,
      fontFamily: 'Roboto',
      fontSize:size==0?Dimensions.font20:size,
      fontWeight: FontWeight.w400,
      ),
    );
  }
}
