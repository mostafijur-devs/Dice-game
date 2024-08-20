import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  const MyBox({
    super.key,
    required this.widget,
    this.height = 100,
    this.weight = 100,
    // this.containerColor = Colors.red,
    this.textColor  = Colors.black,
    this.textFontSize = 18,
  });

  final double height;
  final double weight;
  // final Color containerColor ;
  final Color textColor;
  final double textFontSize ;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: weight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      // color: containerColor,
      child: widget,
    );
  }
}
