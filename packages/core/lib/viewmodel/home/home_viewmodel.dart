import 'package:core/model/login_model.dart';
import 'package:core/utils/secure_storage.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  HomeViewModel({required this.helper});

  final StorageHelper helper;
  CompanySite site = CompanySite();
  int id = 0;
  bool isLogout = false;
  bool isPressed = false;
  bool isToggled = true;
  Offset position = Offset(50, 20);

  Future<void> getSite() async {
    String? siteId = await helper.getSite();
    if (siteId == null) {
      id = 0;
      notifyListeners();
    } else {
      LoginModel? loginModel = await helper.getDataUser();
      id = int.parse(siteId);
      site = loginModel!.data!.user!.companySite!
          .where((element) => element.id == id)
          .toList()[0];
      notifyListeners();
    }
  }

  Future<void> setSite(CompanySite companySite) async {
    site = companySite;
    await helper.setSite(companySite.id!);
    id = companySite.id!;
    notifyListeners();
  }

  Future<void> logout() async {
    try {
      isLogout = true;
      notifyListeners();
      await helper.deleteAll();
    } catch (e) {
      throw e.toString();
    } finally {
      isLogout = false;
      notifyListeners();
    }
  }

  void onTap() {
    if (isPressed == true) {
      isPressed = false;
      notifyListeners();
    } else if (isPressed == false) {
      isPressed = true;
      notifyListeners();
    }
  }

  void onLongPress() {
    isPressed = true;
    notifyListeners();
  }

  void onLongPressCancel() {
    isPressed = false;
    notifyListeners();
  }

  void onPanUpdate(DragUpdateDetails details) {
    position = details.globalPosition + Offset(-90, -360);
    notifyListeners();
  }

  void onPanEnd(DragEndDetails details) {
    position = Offset(0, 20);
    notifyListeners();
  }

  void toggleDrawer(bool isDismissed) {
    isToggled = isDismissed;
    notifyListeners();
  }
}
