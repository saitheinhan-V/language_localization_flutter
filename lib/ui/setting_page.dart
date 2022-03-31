import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:language_test/constant/keys.dart';
import 'package:language_test/provider/settings_provider.dart';
import 'package:language_test/utils/locale_keys.g.dart';


class SettingPage extends HookConsumerWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final settings = ref.watch(settingNotify);
    // final exchanges = ref.watch(exchangesProvider);
    // final pairs = ref.watch(pairsProvider);
    final details = settings.maybeWhen(data: (details) => details, orElse: () => null);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     LocaleKeys.settingsTitle.tr()
      //   ),
      // ),
          body: details != null ?
          Container(
            key: Keys.SETTINGS_SCREEN,
            child: Column(
              children: [
                AppBar(
                  title: Text(LocaleKeys.settingsTitle.tr()),
                ),
                Expanded(
                    child: InkWell(
                      onTap: (){
                        var lang =  Localizations.localeOf(context);
                        showLanguageSelectionDialog(
                            context, ref, lang.languageCode);
                      },
                      child: Text(
                        LocaleKeys.language.tr(),
                      ),
                    )
                ),
              ],
            ),
          ) : const Center(
              child:  CircularProgressIndicator()),
        );
  }

  void showLanguageSelectionDialog(
      BuildContext context, WidgetRef ref, String currentLenguage) {
    var radioValue = currentLenguage;
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

                      ref
                          .read(settingNotify.notifier)
                          .setLanguage(LocaleKeys.english);

                      radioValue = value!;

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
                      ref
                          .read(settingNotify.notifier)
                          .setLanguage(LocaleKeys.myanmar);

                      radioValue = value!;

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
}
