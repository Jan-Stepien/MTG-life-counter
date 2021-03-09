import 'package:flutter/material.dart';

import 'faded_text.dart';

class LifeModyfyingTile extends StatelessWidget{
  final Function callBack;
  final num modifier;
  final String text;

  const LifeModyfyingTile({Key key, this.callBack, this.modifier, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTapDown: (TapDownDetails details) =>
                          callBack(details, modifier),
                      child: FadedText(text: text));
  }
} 