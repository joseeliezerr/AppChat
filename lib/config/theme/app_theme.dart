import 'package:flutter/material.dart';

const Color _customColor=Color(0xFF00916E);

const List<Color>_colorThemes=[
  _customColor,
  Colors.redAccent,
  Colors.blueGrey,
  Colors.deepOrange,
  Colors.blue

];

class AppTheme{
  final int selectedColor;

  AppTheme({
    this.selectedColor=0
  }
     
  ):assert(selectedColor>=0 && selectedColor<=_colorThemes.length-1,'Colors must be between 0 and ${_colorThemes.length}');


  ThemeData theme(){

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    //  brightness: Brightness.dark
    );
  }
}