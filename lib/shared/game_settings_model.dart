import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GameSettingsModel extends ChangeNotifier{
  List<num> playersLife = [20,20];
  List<Color> playersColor = [Colors.red, Colors.blue];
  bool isLifeGainOrientationHorizontal = true;
  List<num> displayedValuesOrder = [-5,5,-1,1];
  bool isPositivePositionedRight = true;


  setPlayerLife(num lifeChange, num playerIndex){
    playersLife[playerIndex] = playersLife[playerIndex] + lifeChange;
    notifyListeners();
  }
  setPlayerColor(Color color, num playerIndex){
    playersColor[playerIndex] = color;
    notifyListeners();
  }
  resetPlayerLifes(){
    for (var i = 0; i < playersLife.length; i++) {
      playersLife[i] = 20; 
    }
    notifyListeners();
  }
  changeHorizontalOrientation(bool value){
    isLifeGainOrientationHorizontal = value;
    var indexModifier = isPositivePositionedRight ? 1 : 2;

    if(isPositivePositionedRight){
      for(int i = 0; i < displayedValuesOrder.length; i = i + 2){
        var tmp = displayedValuesOrder[i];
        displayedValuesOrder[i] = displayedValuesOrder[i+indexModifier];
        displayedValuesOrder[i+indexModifier] = tmp;
      }
    }else{
      for(int i = 0; i < displayedValuesOrder.length/2; i = i + 1){
          var tmp = displayedValuesOrder[i];
          displayedValuesOrder[i] = displayedValuesOrder[i+indexModifier];
          displayedValuesOrder[i+indexModifier] = tmp;
      }
    }
    
    
    
    notifyListeners();
  }
  changePositivePositionedRight(bool value){
    isPositivePositionedRight = value;
    var tmp = displayedValuesOrder[0];
    displayedValuesOrder[0] = displayedValuesOrder.last;
    displayedValuesOrder.last = tmp;

    notifyListeners();
  }
}