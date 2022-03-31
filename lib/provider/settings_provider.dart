
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:language_test/constant/default.dart';
import 'package:language_test/models/settings/settings_details/settings_details.dart';
import 'package:language_test/models/settings/settings_state/settings_state.dart';

final flutterDatabase =
    Provider<FlutterSecureStorage>((ref) => const FlutterSecureStorage());

final settingNotify = StateNotifierProvider<SettingsNotifier, SettingsState>(
    (ref) => SettingsNotifier(ref.read));

class SettingsNotifier extends StateNotifier<SettingsState> {
  final Reader read;

  late SettingsDetails details;

  SettingsNotifier(this.read) : super(SettingsState.initial()) {
    loadData();
  }

  void loadData() async {
    state = SettingsState.loading();
    final language = (await read(flutterDatabase).read(key: "language")) ??
        Default.defaultLanguage;
    final exchange = (await read(flutterDatabase).read(key: "exchange")) ??
        Default.defaultExchange;
    final pair =
        (await read(flutterDatabase).read(key: "pair")) ?? Default.defaultPair;
    final theme =
        (await read(flutterDatabase).read(key: "theme")) ?? Default.defaultTheme;
    details = SettingsDetails(
        currentLanguage: language,
        favoriteExchange: exchange,
        favoritePair: pair,
        themeMode: theme);
    state = SettingsState.data(details: details);
  }

  void setLanguage(String language) async {
    state = SettingsState.loading();
    await read(flutterDatabase).write(key: "language", value: language);
    details = details.copyWith(currentLanguage: language);
    state = SettingsState.data(details: details);
  }

  /*Future<void> setFavoriteExchange(String exchange) async {
    state = SettingsState.loading();
    await read(flutterDatabase).write(key: "exchange", value: exchange);
    details = details.copyWith(favoriteExchange: exchange);
    state = SettingsState.data(details: details);
    verifyFavoritePair();
  }*/

  /*Future<void> verifyFavoritePair() async {
    try {
      await read(cryptoRepository)
          .getPairSummary(details.favoriteExchange, details.favoritePair);
    } on DataException catch (error) {
      if (error.message == LocaleKeys.errorRequestNotFound) {
        List<Pair> pairs =
            await read(cryptoRepository).getPairs(details.favoriteExchange);
        setFavoritePair(pairs.first.pair);
      }
    }
  }

  Future<void> setFavoritePair(String pair) async {
    state = SettingsState.loading();
    await read(flutterDatabase).write(key: "pair", value: pair);
    details = details.copyWith(favoritePair: pair);
    state = SettingsState.data(details: details);
  }*/

  void setTheme(String theme) async {
    state = SettingsState.loading();
    await read(flutterDatabase).write(key: "theme", value: theme);
    details = details.copyWith(themeMode: theme);
    state = SettingsState.data(details: details);
  }
}
