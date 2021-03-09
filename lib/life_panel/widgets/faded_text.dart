import 'package:flutter/material.dart';

class FadedText extends StatelessWidget {
  const FadedText({Key key, this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: 
        Flex(
          mainAxisAlignment: MainAxisAlignment.center,
          direction: Axis.vertical,
          children: [
          Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.2),
                  fontSize: 25,
                  fontWeight: FontWeight.bold))
        ]));
  }
}
