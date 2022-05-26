import 'dart:io';

import 'package:core/api/coal_api.dart';
import 'package:core/constants/colors.dart';
import 'package:core/model/history/coal/hauler_model.dart';
import 'package:core/model/history/coal/loader_model.dart';
import 'package:core/model/history/coal/plan_prod_activity_model.dart';
import 'package:core/model/history/coal/post_coal_model.dart';
import 'package:core/model/history/coal/problem_model.dart';
import 'package:core/model/state/coal_dropdown/plan_prod_state.dart';
import 'package:core/utils/secure_storage.dart';
import 'package:core/widget/bottom_sheet_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormCoalViewModel with ChangeNotifier {
  FormCoalViewModel({required this.api, required this.helper});
  final CoalClient api;
  final StorageHelper helper;
  bool isLoading = false;
  dynamic error;

  Future<void> postPlanCoal(String eventDate, num plan) async {
    try {
      isLoading = true;
      notifyListeners();
      final userData = await helper.getDataUser();
      final companySiteId = await helper.getSite();
      final result = await api.postPlanCoal(
          token: userData!.data!.token!,
          companySiteId: int.parse(companySiteId!),
          eventDate: eventDate,
          plan: plan);
      if (result.status == 0 && result.message != null) {
        error = result.message.toString();
      } else if (result.status == 0) {
        error = 'Terjadi kesalahan';
      } else {
        error = null;
      }
    } catch (e) {
      if (e is SocketException || e is WebSocketException) {
        error = 'Anda tidak terhubung ke internet';
      }
      if (e is FormatException) {
        error = 'Terjadi kesalahan server';
      } else {
        error = e.toString();
      }
      throw e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> postCoal(PostCoalModel postCoalModel) async {
    try {
      isLoading = true;
      notifyListeners();
      final userData = await helper.getDataUser();
      final companySiteId = await helper.getSite();
      final result = await api.postCoal(
          token: userData!.data!.token!,
          companySiteId: int.parse(companySiteId!),
          postCoalModel: postCoalModel);
      print(result);
      if (result.status == 0 && result.message != null) {
        error = result.message.toString();
      } else if (result.status == 0) {
        error = 'Data gagal tersimpan';
      } else if (result.status == 1) {
        error == null;
      }
    } catch (e) {
      if (e is SocketException || e is WebSocketException) {
        error = 'Anda tidak terhubung ke internet';
      }
      if (e is FormatException) {
        error = 'Terjadi kesalahan server';
      } else {
        error = e.toString();
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> selectDate(BuildContext context, NavigatorState navigator,
      ScaffoldMessengerState scaffoldMessenger) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));
    if (picked != null) {
      String? formattedPicked =
          picked.toString().substring(0, picked.toString().indexOf(" "));
      if (formattedPicked.isNotEmpty) {
        return formattedPicked;
      }
    } else {
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('No date selected'),
      ));
      return "";
    }
  }

  Future<dynamic> showDataSheet(
    BuildContext context,
    List<PlanProdModel> data,
    FormCoalViewModel viewModel,
    NavigatorState navigator,
  ) async {
    final controller = TextEditingController();
    List<DropdownDataModel> temps = [];
    for (var title in data) {
      temps.add(DropdownDataModel(label: title.name, value: title.id));
    }
    final selected = await showModalBottomSheet<DropdownDataModel>(
        isScrollControlled: true,
        backgroundColor: kSecondaryColor,
        context: context,
        builder: (context) => AnimatedPadding(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              padding: MediaQuery.of(context).viewInsets,
              child: BottomSheetDropdown(
                modalTitle: 'Activity',
                data: temps,
                controller: controller,
                navigator: navigator,
              ),
            ));
    if (selected != null) {
      return '${selected.value!} - ${selected.label!}';
      // controller.dispose();
    }
    return '';
  }

  Future<dynamic> showDataLoader(
    BuildContext context,
    List<LoaderModel> data,
    FormCoalViewModel viewModel,
    NavigatorState navigator,
  ) async {
    final controller = TextEditingController();
    List<DropdownDataModel> temps = [];
    for (var title in data) {
      temps.add(DropdownDataModel(label: title.name, value: title.id));
    }
    final selected = await showModalBottomSheet<DropdownDataModel>(
        isScrollControlled: true,
        backgroundColor: kSecondaryColor,
        context: context,
        builder: (context) => AnimatedPadding(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              padding: MediaQuery.of(context).viewInsets,
              child: BottomSheetDropdown(
                modalTitle: 'Loader',
                data: temps,
                controller: controller,
                navigator: navigator,
              ),
            ));
    if (selected != null) {
      return '${selected.value!} - ${selected.label!}';
      // controller.dispose();
    }
    return '';
  }

  Future<dynamic> showDataProblem(
    BuildContext context,
    List<ProblemModel> data,
    FormCoalViewModel viewModel,
    NavigatorState navigator,
  ) async {
    final controller = TextEditingController();
    List<DropdownDataModel> temps = [];
    for (var title in data) {
      temps.add(DropdownDataModel(label: title.name, value: title.id));
    }
    final selected = await showModalBottomSheet<DropdownDataModel>(
        isScrollControlled: true,
        backgroundColor: kSecondaryColor,
        context: context,
        builder: (context) => AnimatedPadding(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              padding: MediaQuery.of(context).viewInsets,
              child: BottomSheetDropdown(
                modalTitle: 'Problem',
                data: temps,
                controller: controller,
                navigator: navigator,
              ),
            ));
    if (selected != null) {
      return '${selected.value!} - ${selected.label!}';
    }
    return '';
  }

  void tapped() {
    notifyListeners();
  }
}

class DropdownCoalData extends StateNotifier<PlanProdState> {
  DropdownCoalData({required this.api, required this.helper})
      : super(const PlanProdState.dataLoading(
            {"activity": [], "loader": [], "hauler": [], "problem": []})) {
    init();
  }

  final CoalClient api;
  final StorageHelper helper;

  List<PlanProdModel> _planProd = [];
  List<LoaderModel> _loader = [];
  List<HaulerModel> _hauler = [];
  List<ProblemModel> _problem = [];
  final Map<String, dynamic> _data = {};

  void init() {
    fetchPlanProd();
    fetchLoader();
    fetchHauler();
    fetchProblem();
  }

  Future<void> fetchPlanProd() async {
    try {
      // state = PlanProdState.dataLoading(_data);
      final userData = await helper.getDataUser();
      final result = await api.getPlanProd(token: userData!.data!.token!);
      if (result.status == 0 && result.message != null) {
        state = PlanProdState.error(result.message.toString());
      } else if (result.status == 1 && result.data != null) {
        _data["activity"] = _planProd = result.data!;
        state = PlanProdState.data(_data);
      } else {
        state = const PlanProdState.error('Terjadi kesalahan server');
      }
    } catch (e) {
      if (e is SocketException || e is WebSocketException) {
        state = const PlanProdState.error('Anda tidak terhubung ke internet');
      }
      if (e is FormatException) {
        state = const PlanProdState.error('Terjadi kesalahan server');
      } else {
        state = PlanProdState.error(e.toString());
      }
    }
  }

  Future<void> fetchLoader() async {
    try {
      // state = PlanProdState.dataLoading(_data);
      final userData = await helper.getDataUser();
      final result = await api.getLoader(token: userData!.data!.token!);
      if (result.status == 0 && result.message != null) {
        state = PlanProdState.error(result.message.toString());
      } else if (result.status == 1 && result.data != null) {
        _data["loader"] = _loader = result.data!;
        state = PlanProdState.data(_data);
      } else {
        state = const PlanProdState.error('Terjadi kesalahan server');
      }
    } catch (e) {
      if (e is SocketException || e is WebSocketException) {
        state = const PlanProdState.error('Anda tidak terhubung ke internet');
      }
      if (e is FormatException) {
        state = const PlanProdState.error('Terjadi kesalahan server');
      } else {
        state = PlanProdState.error(e.toString());
      }
    }
  }

  Future<void> fetchHauler() async {
    try {
      // state = PlanProdState.dataLoading(_data);
      final userData = await helper.getDataUser();
      final result = await api.getHauler(token: userData!.data!.token!);
      if (result.status == 0 && result.message != null) {
        state = PlanProdState.error(result.message.toString());
      } else if (result.status == 1 && result.data != null) {
        _data["hauler"] = _hauler = result.data!;
        state = PlanProdState.data(_data);
      } else {
        state = const PlanProdState.error('Terjadi kesalahan server');
      }
    } catch (e) {
      if (e is SocketException || e is WebSocketException) {
        state = const PlanProdState.error('Anda tidak terhubung ke internet');
      }
      if (e is FormatException) {
        state = const PlanProdState.error('Terjadi kesalahan server');
      } else {
        state = PlanProdState.error(e.toString());
      }
    }
  }

  Future<void> fetchProblem() async {
    try {
      // state = PlanProdState.dataLoading(_data);
      final userData = await helper.getDataUser();
      final result = await api.getProblem(token: userData!.data!.token!);
      if (result.status == 0 && result.message != null) {
        state = PlanProdState.error(result.message.toString());
      } else if (result.status == 1 && result.data != null) {
        _data["problem"] = _problem = result.data!;
        state = PlanProdState.data(_data);
      } else {
        state = const PlanProdState.error('Terjadi kesalahan server');
      }
    } catch (e) {
      if (e is SocketException || e is WebSocketException) {
        state = const PlanProdState.error('Anda tidak terhubung ke internet');
      }
      if (e is FormatException) {
        state = const PlanProdState.error('Terjadi kesalahan server');
      } else {
        state = PlanProdState.error(e.toString());
      }
    }
  }
}
