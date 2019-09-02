// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$SettingsStore on _SettingsStore, Store {
  final _$showPageAtom = Atom(name: '_SettingsStore.showPage');

  @override
  String get showPage {
    _$showPageAtom.context.enforceReadPolicy(_$showPageAtom);
    _$showPageAtom.reportObserved();
    return super.showPage;
  }

  @override
  set showPage(String value) {
    _$showPageAtom.context.conditionallyRunInAction(() {
      super.showPage = value;
      _$showPageAtom.reportChanged();
    }, _$showPageAtom, name: '${_$showPageAtom.name}_set');
  }

  final _$getPrefsDataAsyncAction = AsyncAction('getPrefsData');

  @override
  Future getPrefsData() {
    return _$getPrefsDataAsyncAction.run(() => super.getPrefsData());
  }

  final _$saveShowPageAsyncAction = AsyncAction('saveShowPage');

  @override
  Future saveShowPage(String showPage) {
    return _$saveShowPageAsyncAction.run(() => super.saveShowPage(showPage));
  }
}
