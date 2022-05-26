import 'dart:convert';

import 'package:core/model/history/coal/plan_prod_activity_model.dart';
import 'package:core/model/login_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageHelper {
  final _storage = const FlutterSecureStorage();
  static const _userData = 'userData';
  static const _companySite = 'companySite';
  static const _planProd = 'planProd';

  // set data
  Future setUser(LoginModel loginModel) async {
    final value = jsonEncode(loginModel);
    await _storage.write(key: _userData, value: value);
  }

  Future setSite(int id) async {
    await _storage.write(key: _companySite, value: id.toString());
  }

  Future setPlanprod(List<PlanProdModel> data) async {
    final value = jsonEncode(data);
    await _storage.write(key: _planProd, value: value);
  }

  // get data
  Future<LoginModel?> getDataUser() async {
    final value = await _storage.read(key: _userData);
    if (value == null) {
      return null;
    } else {
      return LoginModel.fromJson(jsonDecode(value));
    }
  }

  Future<String?> getSite() async {
    return _storage.read(key: _companySite);
  }

  Future<List<PlanProdModel>> getPlanProd() async {
    final value = await _storage.read(key: _planProd);
    final data = jsonDecode(value!);
    return List<PlanProdModel>.from(
        data.map((item) => PlanProdModel.fromJson(item)));
  }

  // delete data
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  Future<void> deleteDataUser() async {
    await _storage.delete(key: _userData);
  }
}
