import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function function;

  RoundIconButton({@required this.icon, @required this.function});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      textStyle: TextStyle(
        color: Color(0xFFE8E8E8),
        fontSize: 50,
      ),
      child: Icon(icon),
      shape: CircleBorder(),
      onPressed: function,
    );
  }
}
