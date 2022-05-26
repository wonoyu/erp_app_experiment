import 'package:core/api/coal_api.dart';
import 'package:core/api/login_api.dart';
import 'package:core/model/state/coal_dropdown/plan_prod_state.dart';
import 'package:core/model/state/coal_state.dart';
import 'package:core/model/state/module_state.dart';
import 'package:core/utils/secure_storage.dart';
import 'package:core/viewmodel/coal/form_coal_viewmodel.dart';
import 'package:core/viewmodel/coal/history_coal_viewmodel.dart';
import 'package:core/viewmodel/home/home_viewmodel.dart';
import 'package:core/viewmodel/login/login_viewmodel.dart';
import 'package:core/viewmodel/select_date.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = ChangeNotifierProvider<LoginViewModel>(
    (ref) => LoginViewModel(api: LoginClient(), helper: StorageHelper()));

final coalModelProvider =
    StateNotifierProvider.autoDispose<HistoryCoalViewModel, CoalState>((ref) =>
        HistoryCoalViewModel(api: CoalClient(), helper: StorageHelper()));

final formCoalProvider = ChangeNotifierProvider<FormCoalViewModel>(
    (ref) => FormCoalViewModel(api: CoalClient(), helper: StorageHelper()));

final dropdownCoalData =
    StateNotifierProvider.autoDispose<DropdownCoalData, PlanProdState>(
        (ref) => DropdownCoalData(api: CoalClient(), helper: StorageHelper()));

final dateProvider = ChangeNotifierProvider<SelectDate>((ref) => SelectDate());

final backProvider = ChangeNotifierProvider<HomeViewModel>(
    (ref) => HomeViewModel(helper: StorageHelper()));

final modulesProvider =
    StateNotifierProvider.autoDispose<GetModuleVM, ModuleState>(
        (ref) => GetModuleVM(api: LoginClient(), helper: StorageHelper()));

final logoutProvider = StateProvider<bool>((ref) => false);
