import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:language_test/models/settings/settings_details/settings_details.dart';

part 'settings_state.freezed.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _SettingsStateInitial;
  const factory SettingsState.loading() = _SettingsStateLoading;
  const factory SettingsState.data({required SettingsDetails details}) =
      _SetttingsStateData;
  const factory SettingsState.error({String? error}) = _SettingsStateError;
}