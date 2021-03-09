import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mtg_life_counter/life_panel/widgets/life_modifying_tile.dart';
import 'package:mtg_life_counter/shared/game_settings_model.dart';
import 'package:provider/provider.dart';

class LifePanel extends StatefulWidget {
  final Color color;
  final num life;
  final num playerIndex;
  final List<num> displayedValuesOrder;

  LifePanel(
      {Key key,
      this.color,
      this.life,
      this.playerIndex,
      this.displayedValuesOrder})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _LifePanelState();
}

class _LifePanelState extends State<LifePanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: widget.color,
            border: Border.all(
                width: 8.0,
                color: Color.lerp(widget.color, Colors.white, 0.15))),
        child: Stack(children: [
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Expanded(
                child: Row(children: [
              Expanded(
                  child: LifeModyfyingTile(
                      callBack: _addLifeCount,
                      modifier: widget.displayedValuesOrder[0],
                      text: formatText(widget.displayedValuesOrder[0]))),
              Expanded(
                  child: LifeModyfyingTile(
                      callBack: _addLifeCount,
                      modifier: widget.displayedValuesOrder[1],
                      text: formatText(widget.displayedValuesOrder[1]))),
            ])),
            Expanded(
                child: Row(children: [
              Expanded(
                  child: LifeModyfyingTile(
                      callBack: _addLifeCount,
                      modifier: widget.displayedValuesOrder[2],
                      text: formatText(widget.displayedValuesOrder[2]))),
              Expanded(
                  child: LifeModyfyingTile(
                      callBack: _addLifeCount,
                      modifier: widget.displayedValuesOrder[3],
                      text: formatText(widget.displayedValuesOrder[3]))),
            ]))
          ]),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                widget.life.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 120,
                    fontWeight: FontWeight.bold),
              )
            ]),
          ])
        ]));
  }

  void _addLifeCount(TapDownDetails details, num value) => this.setState(() {
        Provider.of<GameSettingsModel>(context, listen: false)
            .setPlayerLife(value, widget.playerIndex);
      });
  String formatText(num value) {
    return value > 0 ? '+' + value.toString() : value.toString();
  }
}
