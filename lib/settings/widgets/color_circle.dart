import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget{
  final Color color;
  final num size;
  final num margin;
  final bool selected;
  const ColorCircle({Key key, this.color, this.size, this.margin, this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      
      height: size,
      width: size,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        color: color, 
        shape: BoxShape.circle),
      child: Visibility( visible: selected == true, child: Icon(Icons.brush_rounded , color: Colors.black)) 
    )
    ;
  }
  
}