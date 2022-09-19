import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightTheme(BuildContext context)=>ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      color: kPrimary,
    ),

    primaryColor: kPrimary,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(color: kIconLight),
    textTheme: (Theme.of(context).textTheme).apply(
        displayColor: Colors.black
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity
);

ThemeData darkTheme(BuildContext context)=>ThemeData.dark().copyWith(
    primaryColor: kPrimary,
    scaffoldBackgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.black),
     textTheme: (Theme.of(context).textTheme).apply(
        displayColor: Colors.white
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity
);

bool isLightTheme(BuildContext context){
  return MediaQuery.of(context).platformBrightness==Brightness.light;
}