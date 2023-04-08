// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onborad_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnBoardViewModel on _OnBoardViewModelBase, Store {
  late final _$isDoneAtom =
      Atom(name: '_OnBoardViewModelBase.isDone', context: context);

  @override
  bool get isDone {
    _$isDoneAtom.reportRead();
    return super.isDone;
  }

  @override
  set isDone(bool value) {
    _$isDoneAtom.reportWrite(value, super.isDone, () {
      super.isDone = value;
    });
  }

  late final _$_OnBoardViewModelBaseActionController =
      ActionController(name: '_OnBoardViewModelBase', context: context);

  @override
  void nextPage() {
    final _$actionInfo = _$_OnBoardViewModelBaseActionController.startAction(
        name: '_OnBoardViewModelBase.nextPage');
    try {
      return super.nextPage();
    } finally {
      _$_OnBoardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDone: ${isDone}
    ''';
  }
}
