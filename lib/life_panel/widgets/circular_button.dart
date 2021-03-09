import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget{
  
  final Icon icon;
  final Function onClick;
  final Color color;
  final double height;
  final double width;
  final double margin;
  CircularButton( { this.height, this.width,this.icon, this.onClick, this.color, this.margin });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      width: width,
      height: height,
      decoration: BoxDecoration(color: color,shape: BoxShape.circle),
      child: IconButton( icon: icon,  onPressed: onClick)
      );
  }

}