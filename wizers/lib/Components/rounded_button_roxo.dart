import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedButtonRoxo extends StatelessWidget {
final String text;
final Function press;
final Color color, textcolor;
  const RoundedButtonRoxo({
    Key key, 
    this.text, 
    this.press, 
    this.color = wizeRoxo, 
    this.textcolor = Colors.white,
  
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
    margin: EdgeInsets.symmetric(vertical:8),
      width: size.width * 0.8,
                      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
                        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical:15, horizontal:30),
          onPressed: press,
          color: color,
          child: Text(text, style: TextStyle(
            color:textcolor),),
        ),
      ),
    );
  }
}