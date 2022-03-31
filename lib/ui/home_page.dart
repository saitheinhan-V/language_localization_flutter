import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:language_test/constant/default.dart';
import 'package:language_test/constant/theme_util.dart';
import 'package:language_test/provider/settings_provider.dart';
import 'package:language_test/utils/locale_keys.g.dart';

class HomePage extends HookConsumerWidget {
  HomePage({Key? key}) : super(key: key);

  bool darkMode = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var brightness = MediaQuery.of(context).platformBrightness;
    darkMode = brightness == Brightness.dark;

    final settings = ref.watch(settingNotify);
    // final exchanges = ref.watch(exchangesProvider);
    // final pairs = ref.watch(pairsProvider);

    final details =
    settings.maybeWhen(data: (details) => details, orElse: () => null);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.homeTitle.tr()),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
                height: 100,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      var lang = Localizations.localeOf(context);
                      showLanguageSelectionDialog(
                          context, ref, lang.languageCode);
                    },
                    child: Text(
                      LocaleKeys.language.tr(),
                    ),
                  ),
                )),
            Container(
              height: 100.0,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      var lang = Localizations.localeOf(context);
                      showThemeSelectDialog(
                          context, ref, details?.themeMode);
                    },
                    child: Text(
                      details?.themeMode ?? "Theme",
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

  void showLanguageSelectionDialog(
      BuildContext context, WidgetRef ref, String currentLenguage) {
    late String? radioValue = currentLenguage;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(LocaleKeys.language.tr()),
        content: Container(
          height: 100,
          child: Column(
            children: [
              Row(
                children: [
                  Radio<String>(
                    value: 'en',
                    groupValue: radioValue,
                    onChanged: (value) async {
                      await context.setLocale(const Locale('en'));

                      // ref
                      //     .read(settingNotify.notifier)
                      //     .setLanguage(LocaleKeys.english);
                      radioValue = value;
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    LocaleKeys.english.tr(),
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    value: 'my',
                    groupValue: radioValue,
                    onChanged: (value) async {
                      await context.setLocale(const Locale('my'));
                      // ref
                      //     .read(settingNotify.notifier)
                      //     .setLanguage(LocaleKeys.myanmar);
                      radioValue = value;
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    LocaleKeys.myanmar.tr(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showThemeSelectDialog(
      BuildContext context, WidgetRef ref, currentTheme) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 150,
              child: Column(
                children: Default.themeModes
                    .map((data) => GestureDetector(
                          onTap: () {
                            ref
                                .read(settingNotify.notifier)
                                .setTheme(data);

                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Radio<String>(
                                onChanged: (value) {
                                  ref
                                      .read(settingNotify.notifier)
                                      .setTheme(value!);
                                  Navigator.pop(context);
                                },
                                value: data,
                                groupValue: currentTheme,
                              ),
                              Text(data, style: TextStyle(fontSize: 18))
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
          );
        });
  }
}
