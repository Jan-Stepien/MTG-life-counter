import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'color_picker_container.dart';
import '../../shared/game_settings_model.dart';

class GameSettingsContainer extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => GameSettingsState();
}

class GameSettingsState extends State<GameSettingsContainer> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          child: 
            ListView(children:[
              
            Consumer<GameSettingsModel>(
                builder: (context, gameSettings, child) 
                => 
                ListTile(
                title: Text('Values orientation'),
                subtitle: gameSettings.isPositivePositionedRight ? Text('Positive values positioned vertical'): Text('Positive values positioned horizontal'),
                trailing: Switch(
                  value: gameSettings.isPositivePositionedRight,
                  onChanged: ( value) => { 
                    this.setState(() {
                      Provider.of<GameSettingsModel>(context, listen: false).changePositivePositionedRight(!gameSettings.isPositivePositionedRight);
                    })
                  }
                )
              
              )
            ),
            Consumer<GameSettingsModel>(
                builder: (context, gameSettings, child) 
                => 
                ListTile(
                title: Text('Ascending order'),
                subtitle: gameSettings.isPositivePositionedRight ? gameSettings.isLifeGainOrientationHorizontal ? Text('Ascending left to right'): Text('Ascending right to left') : gameSettings.isLifeGainOrientationHorizontal ? Text('Ascending bottom to top'): Text('Ascending top to bottom') ,
                trailing: Switch(
                  value: gameSettings.isLifeGainOrientationHorizontal,
                  onChanged: ( value) => { 
                    this.setState(() {
                      Provider.of<GameSettingsModel>(context, listen: false).changeHorizontalOrientation(!gameSettings.isLifeGainOrientationHorizontal);
                    })
                  }
                )
              
              )
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          _choosePlayersColor();
                        },
                        child: Text('Choose players color',
                            style: TextStyle(fontSize: 18))))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          _resetCurrentGame();
                        },
                        child: Text('Restart game',
                            style: TextStyle(fontSize: 18))))
              ],
            )
          ])),
      appBar: AppBar(
        title: Text('Settings'),
      ),
    );
  }

  _resetCurrentGame() {
    Provider.of<GameSettingsModel>(context, listen: false).resetPlayerLifes();
    Navigator.pop(context);
  }
  _choosePlayersColor(){
    Navigator.push(context, _colorPickerRoute());
  }

  Route _colorPickerRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimaton) => ColorPickerContainer(),
      transitionsBuilder: (context, animation, secondaryAnimation, child){
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child);
      },
    );
  }

}
