
import 'package:flutter/material.dart';

ThemeMode getThemeMode(String type) {
  ThemeMode themeMode = ThemeMode.system;
  switch (type) {
    case "System":
      themeMode = ThemeMode.system;
      break;
    case "Dark":
      themeMode = ThemeMode.dark;
      break;
    case "Light":
      themeMode = ThemeMode.light;
      break;
  }
  // if (isDark) {
  //   themeMode = ThemeMode.dark;
  // }else{
  //   themeMode = ThemeMode.light;
  // }
  return themeMode;
}

String getThemeText(bool isDark){
  var text = "Light";
  if (isDark) {
    text = "Dark";
  }

  return text;
}

