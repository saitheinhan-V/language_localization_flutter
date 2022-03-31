import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:language_test/base.dart';
import 'package:language_test/provider/settings_provider.dart';
import 'package:language_test/provider/theme_provider.dart';
import 'package:language_test/ui/theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'constant/theme_util.dart';
// import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('my')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const ProviderScope(child: MyApp())));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // final theme = ref.watch(appThemeProvider);
    // final themeMode = ref.watch(appThemeModeProvider);
    final settings = ref.watch(settingNotify);

    final themeMode = settings.maybeWhen(
        data: (data) => getThemeMode(data.themeMode),
        orElse: () => ThemeMode.system);

    return MaterialApp(
      title: 'Flutter Demo',
      home:  BasePage(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
        themeMode: themeMode,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme
    );
  }
}
