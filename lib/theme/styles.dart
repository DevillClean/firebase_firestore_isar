import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color.fromARGB(255, 0, 8, 153);
const inactiveCardColor = Color(0xFF161A3C);
const bgk = Color(0xFF111328);
const bottomContainerColor = Color.fromARGB(255, 255, 0, 0);
const textFont = Colors.black;
// ignore: constant_identifier_names
const authcolor = Color(0xFF01B4E4);

const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98), 
);

const numberTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w900
);

const largeBottomTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold 
);

const titleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold  
);

const resultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold  
);

const bmiTextStyle = TextStyle(
  fontSize: 64.0,
  fontWeight: FontWeight.bold  
);

const bodyTextStyle = TextStyle(
  fontSize: 22.0,
);


const tStyleForm = TextStyle(fontSize: 16, color: Color(0xFF212529));
const tStyleFont = TextStyle(color: Colors.white);
const btnColor = Color(0xFF01B4E4); //textFieldColor to

const textFieldDecoration = InputDecoration(
  border: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF01B4E4), width: 2.0)),
  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  isCollapsed: true,
);

const textFieldDecorator = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
      fillColor: Colors.red,
      focusColor: Colors.red,
      hoverColor: Colors.red,
    );