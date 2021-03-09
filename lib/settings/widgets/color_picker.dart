import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'color_circle.dart';
import '../../shared/game_settings_model.dart';

class ColorPicker extends StatefulWidget{
  
  final num playerIndex;
  final Color selectedColor;

  const ColorPicker({Key key, this.playerIndex, this.selectedColor}): super(key: key);
  

  @override
  State<StatefulWidget> createState() => ColorPickerState();
}
class ColorPickerState extends State<ColorPicker>{
  
  static List<Color> colors = [
    Colors.red, Colors.blue, Colors.pink, Colors.indigo,
    Colors.purple, Colors.teal, Colors.yellow, Colors.cyan, 
    Colors.orange, Colors.lime, Colors.brown, Colors.green];
  
  @override
  Widget build(BuildContext context) {
    
    var list = List.generate((colors.length), (index) {
        return ColorCircle( color: colors[index], size: 80.0, margin: 2.0, selected: widget.selectedColor  == colors[index]);
      }); 
    List<List<ColorCircle>> rowList = [];
    for (var i = 0; i < list.length; i= i + 4) {
      List<ColorCircle> tmpRow = [];
      for( var j = 0; j < 4; j++){
        tmpRow.add(list[i+j]);
      }
      rowList.add(tmpRow);
    }
    return Column(children:
      rowList.map(
        (e) => Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: e.map((f) => 
          GestureDetector(child: f, 
          onTapDown: (TapDownDetails details) =>
                          _colorSelected(details, f.color))).toList())).toList()
    );
  }
  _colorSelected(TapDownDetails details, Color color) => this.setState(() {
    print('setting color to:' + color.toString());
      Provider.of<GameSettingsModel>(context, listen: false).setPlayerColor(color, widget.playerIndex);
  });
}
