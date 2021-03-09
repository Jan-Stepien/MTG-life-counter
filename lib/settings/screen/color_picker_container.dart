import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/color_picker.dart';
import '../../shared/game_settings_model.dart';

class ColorPickerContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text(' Player colors')),
      body: ListView( 
        children:[
          Column(children:[
            Container(
              margin: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey[400],width: 3.0)
              ),
              child: Column(children:[
                Text('Player 1',
                style: TextStyle(fontSize: 18),textAlign: TextAlign.left,),
                Consumer<GameSettingsModel>(
                      builder: (context,gameSettings,child) => ColorPicker( playerIndex: 0, selectedColor: gameSettings.playersColor[0]))
              ] ,),
            ),
            Container(
              margin: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey[400],width: 3.0)
              ),
              child: Column(children:[
                Text('Player 2'),
                Consumer<GameSettingsModel>(
                      builder: (context,gameSettings,child) => ColorPicker( playerIndex: 1, selectedColor: gameSettings.playersColor[1]))
              ] ,),
            ),
          ])
        ])
      );
  } 
}