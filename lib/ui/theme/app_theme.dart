import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_colors.dart';

// export 'package:l/ui/theme/app_text_theme.dart' show TextStyleExt;

final appThemeModeProvider =
    StateNotifierProvider<StateController<ThemeMode>, ThemeMode>(
  (ref) => StateController(ThemeMode.dark),
);

// final appThemeProvider = Provider<AppTheme>(
//   (ref) {
//     final mode = ref.watch(appThemeModeProvider);
//     switch (mode) {
//       case ThemeMode.dark:
//         return AppTheme.darkTheme;
//       case ThemeMode.light:
//       default:
//         return AppTheme.light();
//     }
//   },
// );

/*class ThemeNotifier extends ChangeNotifier{
  bool _showBottomBar = true;

  bool get showBottomBar => _showBottomBar;

  set showBottomBar(bool hideMenu) {
    _showBottomBar = hideMenu;
    notifyListeners();
  }
}*/

/*
class AppTheme {
  AppTheme({
    required this.mode,
    required this.data,
    // required this.textTheme,
    required this.appColors,
  });

  factory AppTheme.light() {
    const mode = ThemeMode.light;
    final appColors = AppColors.light();
    final themeData = ThemeData.light().copyWith(
      scaffoldBackgroundColor: appColors.background,
      textTheme: GoogleFonts.notoSansTextTheme(ThemeData.light().textTheme),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: appColors.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
    return AppTheme(
      mode: mode,
      data: themeData,
      // textTheme: AppTextTheme(),
      appColors: appColors,
    );
  }

  factory AppTheme.dark() {
    const mode = ThemeMode.dark;
    final appColors = AppColors.dark();
    final themeData = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: appColors.background,
      textTheme: GoogleFonts.notoSansTextTheme(ThemeData.dark().textTheme),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: appColors.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
    return AppTheme(
      mode: mode,
      data: themeData,
      // textTheme: AppTextTheme(),
      appColors: appColors,
    );
  }

  final ThemeMode mode;
  final ThemeData data;
  // final AppTextTheme textTheme;
  final AppColors appColors;
}
*/

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    iconTheme: IconThemeData(color: Colors.black87),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70),
    appBarTheme: AppBarTheme(
      color: Colors.blueGrey,
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.grey[500],
    unselectedWidgetColor: Colors.black45,
    focusColor: Colors.black,
    textTheme: TextTheme(
      headline1: TextStyle(
          color: Colors.black, fontSize: 40, fontWeight: FontWeight.w500),
      headline2: TextStyle(
          color: Colors.black, fontSize: 34, fontWeight: FontWeight.w400),
      headline3: TextStyle(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
      headline4: TextStyle(
          color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
      headline5: TextStyle(
          color: Colors.black, fontSize: 19, fontWeight: FontWeight.w700),
      headline6: TextStyle(
          color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
      subtitle1: TextStyle(
          color: Colors.black87, fontSize: 14, fontWeight: FontWeight.normal),
      subtitle2: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.black12,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70),
    appBarTheme: AppBarTheme(
      color: Colors.black,
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    focusColor: Colors.white,
    textTheme: TextTheme(
        headline1: TextStyle(
            color: Colors.white, fontSize: 40, fontWeight: FontWeight.w500),
        headline2: TextStyle(
            color: Colors.white, fontSize: 34, fontWeight: FontWeight.w400),
        headline3: TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
        headline4: TextStyle(
            color: Colors.white70, fontSize: 16, fontWeight: FontWeight.bold),
        headline5: TextStyle(
            color: Colors.white, fontSize: 19, fontWeight: FontWeight.w700),
        headline6: TextStyle(
            color: Colors.white, fontSize: 13, fontWeight: FontWeight.w400),
        subtitle1: TextStyle(
            color: Colors.white70, fontSize: 14, fontWeight: FontWeight.normal),
        subtitle2: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
  );
}

