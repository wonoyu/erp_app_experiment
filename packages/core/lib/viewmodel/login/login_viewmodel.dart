import 'dart:io';

import 'package:core/api/login_api.dart';
import 'package:core/model/module_model.dart';
import 'package:core/model/state/module_state.dart';
import 'package:core/utils/secure_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewModel with ChangeNotifier {
  LoginViewModel({required this.api, required this.helper});
  final LoginClient api;
  final StorageHelper helper;
  bool isLoading = false;
  bool isObscured = true;
  dynamic error;

  Future<void> login(String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      final result = await api.login(email: email, password: password);
      if (result.status == 0 && result.message != null) {
        error = result.message.toString();
      } else if (result.data != null) {
        if (result.data!.token != null) {
          await helper.setUser(result);
          await helper.setSite(result.data!.user!.companySite![0].id!);
          error = null;
        }
      } else {
        error = 'User Unauthorized';
      }
    } catch (e) {
      error = e is SocketException || e is WebSocketException
          ? 'Anda tidak terhubung ke internet'
          : e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void toggle() {
    isObscured = !isObscured;
    notifyListeners();
  }

  void tapped() {
    notifyListeners();
  }
}

class GetModuleVM extends StateNotifier<ModuleState> {
  GetModuleVM({required this.api, required this.helper})
      : super(const ModuleState.loading([])) {
    init();
  }
  final LoginClient api;
  final StorageHelper helper;

  List<ModuleModel> _modulesData = [];

  void init() {
    fetchModules();
  }

  Future<void> fetchModules() async {
    try {
      state = ModuleState.loading(_modulesData);
      final userData = await helper.getDataUser();
      final result = await api.getModules(
          token: userData!.data!.token!, roleId: userData.data!.user!.roleId!);
      if (result.status == 0 && result.message != null) {
        state = ModuleState.error(result.message.toString());
      } else if (result.status == 1 && result.data != null) {
        state = ModuleState.loaded(_modulesData = result.data!);
      } else if (result.status == 1) {
        state = ModuleState.loaded(_modulesData = result.data!);
      }
    } catch (e) {
      if (e is SocketException || e is WebSocketException || e is Exception) {
        state = const ModuleState.error('Anda tidak terhubung ke internet');
      } else if (e is FormatException) {
        state = const ModuleState.error('Terjadi kesalahan server');
      }
      state =
          const ModuleState.error('Terjadi kesalahan mohon coba lagi nanti');
      // throw e.toString();
    }
  }
}
