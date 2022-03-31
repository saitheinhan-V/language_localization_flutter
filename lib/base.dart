import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:language_test/provider/navigation_provider.dart';
import 'package:language_test/ui/home_page.dart';
import 'package:language_test/ui/setting_page.dart';
import 'package:language_test/utils/locale_keys.g.dart';

import 'constant/keys.dart';

class BasePage extends HookConsumerWidget{
    BasePage({Key? key}) : super(key: key);

  final List<Widget> pages = [
     HomePage(), SettingPage()
  ];

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final PageModel navigation = ref.watch(navigationProvider);

    return Scaffold(
      body: pages[navigation.index],
      bottomNavigationBar: BottomNavigationBar(
          key: Keys.NAV_BAR,
          currentIndex: navigation.index,
          onTap: (index) {
            ref.read(navigationProvider.notifier).selectPage(index);
          },
          items: [
            BottomNavigationBarItem(
              label: LocaleKeys.homeTitle.tr(),
              icon: const Icon(
                Icons.home,
                key: Keys.NAV_HOME,
              ),
            ),
            BottomNavigationBarItem(
              label: LocaleKeys.settingsTitle.tr(),
              icon: const Icon(
                Icons.settings,
                key: Keys.NAV_SETTINGS,
              ),
            ),
          ]),
    );
  }
}
