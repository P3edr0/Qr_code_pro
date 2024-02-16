import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_code_pro/presentation/utils/constants.dart';

part "home_store.g.dart";

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  List<Color> customNavBarColorsList = [
    ProjectColors.darkRed,
    ProjectColors.darkblue,
    ProjectColors.darkGreen
  ];
  @observable
  bool isExpanded = true;

  @observable
  int currentIndex = 1;

  @observable
  Color selectedColor = ProjectColors.darkblue;
  @action
  setIsExpanded(bool value) {
    isExpanded = value;
  }

  @action
  setCurrentIndex(int value) {
    currentIndex = value;
  }

  @action
  onPageChanged(int value) {
    setIsExpanded(false);
    setCurrentIndex(value);
    setSelectedColor(customNavBarColorsList[value]);
  }

  @action
  setSelectedColor(Color value) => selectedColor = value;
}
