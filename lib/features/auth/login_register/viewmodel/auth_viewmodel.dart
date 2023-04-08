import '../../../../core/base/base_viewmodel/base_viewmodel.dart';
import '../model/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'auth_viewmodel.g.dart';

class AuthViewModel = _AuthViewModelBase with _$AuthViewModel;

abstract class _AuthViewModelBase extends BaseViewModel<AuthModel> with Store {
  late PageController? pageController;
  late TextEditingController? textEditingController;
  late TextEditingController? textEditingController2;

  @observable
  bool isVisible = true;

  @action
  void changeVisible() {
    isVisible = !isVisible;
  }

  void changePage(int a) {
    pageController?.jumpToPage(a);
  }
}
