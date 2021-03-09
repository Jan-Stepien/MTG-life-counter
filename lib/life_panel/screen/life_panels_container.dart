import 'package:flutter/material.dart';
import 'package:mtg_life_counter/settings/screen/game_settings_container.dart';
import 'package:mtg_life_counter/shared/game_settings_model.dart';
import 'package:provider/provider.dart';

import '../widgets/circular_button.dart';
import '../widgets/life_panel.dart';

class LifePanelsContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LifePanelsContainerState();
}

class _LifePanelsContainerState extends State<LifePanelsContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        primary: true,
        appBar: AppBar(toolbarHeight: 0),
        body: OrientationBuilder(builder: (context, orientation) {
          print(orientation);
          if (orientation == Orientation.portrait) {
            return _portraitPanels();
          } else {
            return _landscapePanels();
          }
        }));
  }

  _navigateToGameSettings() {
    Navigator.of(context).push(_settingsRoute());
  }

  Route _settingsRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimaton) =>
          GameSettingsContainer(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  Widget _portraitPanels() {
    return Stack(children: [
      Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  Expanded(
                      child: Consumer<GameSettingsModel>(
                          builder: (context, gameSettings, child) => LifePanel(
                                color: gameSettings.playersColor[0],
                                life: gameSettings.playersLife[0],
                                playerIndex: 0,
                                displayedValuesOrder:
                                    gameSettings.displayedValuesOrder,
                              )))
                ])),
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  Expanded(
                      child: Consumer<GameSettingsModel>(
                          builder: (context, gameSettings, child) => LifePanel(
                              color: gameSettings.playersColor[1],
                              life: gameSettings.playersLife[1],
                              playerIndex: 1,
                              displayedValuesOrder:
                                  gameSettings.displayedValuesOrder)))
                ]))
          ])),
      Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        CircularButton(
          height: 50,
          width: 50,
          color: Colors.white,
          icon: Icon(Icons.settings, color: Colors.black),
          margin: 0,
          onClick: _navigateToGameSettings,
        )
      ]))
    ]);
  }

  Widget _landscapePanels() {
    return Text('Landscape');
  }
}
