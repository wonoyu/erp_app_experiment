import 'package:core/constants/app_constants.dart';
import 'package:core/constants/colors.dart';
import 'package:core/constants/keys.dart';
import 'package:core/model/history/coal/post_coal_model.dart';
import 'package:core/providers.dart';
import 'package:core/viewmodel/coal/form_coal_viewmodel.dart';
import 'package:core/widget/about_dialog_pop.dart';
import 'package:core/widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsp_app1/routes.dart';
import 'package:gsp_app1/view/form/coal/form_coal_confirm.dart';
import 'package:shimmer/shimmer.dart';

class FormCoal extends ConsumerStatefulWidget {
  const FormCoal({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormCoalState();
}

class _FormCoalState extends ConsumerState<FormCoal> {
  final List<TextEditingController> _controller = List.generate(9, (index) {
    if (index == 1) return TextEditingController(text: 'CO');
    return TextEditingController();
  });
  final List<FocusNode> _focusNode = List.generate(9, (index) => FocusNode());
  final _formCoal = GlobalKey<FormState>(debugLabel: Keys.coalForm);

  final List<Map<String, dynamic>> _haulerDialogData = [];

  @override
  void initState() {
    super.initState();
    _fetchData(context, ref);
  }

  @override
  void dispose() {
    for (int i = 0; i < 9; i++) {
      _controller[i].dispose();
      _focusNode[i].dispose();
    }
    super.dispose();
  }

  Future<void> _fetchData(BuildContext context, WidgetRef ref) async {
    final dropdownModel = ref.read(dropdownCoalData.notifier);
    await dropdownModel.fetchPlanProd();
  }

  void showDialouge(
      NavigatorState navigator, Future<dynamic> Function() functions) {
    showDialog(
      context: context,
      builder: (context) => const CupertinoActivityIndicator(
        radius: 30.0,
        color: kSecondaryColor,
      ),
    )
        .timeout(const Duration(milliseconds: 500),
            onTimeout: () => navigator.pop())
        .then((value) => functions());
  }

  Future<bool?> showCupertinoDialouge(
      NavigatorState navigator, FormCoalViewModel viewModel) async {
    return await showCupertinoDialog<bool>(
        context: context,
        builder: (context) => AboutDialogPop(
                onTap: (index) {
                  viewModel.tapped();
                  _haulerDialogData.removeAt(index!);
                },
                title: 'Hauler',
                data: _haulerDialogData,
                actions: [
                  CupertinoDialogAction(
                    child: const Text('Tambah Data'),
                    onPressed: () => navigator.pop(true),
                  ),
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: const Text('Close'),
                    onPressed: () => navigator.pop(false),
                  )
                ]));
  }

  void handleNextButton(
      FormCoalViewModel viewModel,
      ScaffoldMessengerState scaffoldMessenger,
      NavigatorState navigator) async {
    if (_formCoal.currentState!.validate()) {
      final loaderId = _controller[5].text.split(' - ')[0];
      final problemId = _controller[7].text.split(' - ')[0];
      List<MultiHauler> multiHauler = [];
      for (var data in _haulerDialogData) {
        var hauler = MultiHauler(
          unitHaulerId: int.parse(data['hauler_id']),
          rit: num.parse(data['rit']),
          totalBcm: num.parse(data['produksi']),
        );
        multiHauler.add(hauler);
      }
      final coalModel = PostCoalModel(
        planProdActivityId: 5,
        eventDate: _controller[2].text,
        jarak: _controller[3].text,
        shift: _controller[4].text,
        unitLoaderId: int.parse(loaderId),
        productivityProblemId: problemId,
        desc: _controller[8].text,
        multiHauler: multiHauler,
        planProdMovingId: 1,
      );
      final isConfirm = await showCupertinoModalPopup<bool>(
          context: context,
          builder: (context) => FormCoalConfirm(
                title: 'Input Confirmation Coal Data',
                data: coalModel.toJson(),
                isList: 7,
                navigator: navigator,
                confirm: () {},
              ));
      if (isConfirm!) {
        scaffoldMessenger.showSnackBar(const SnackBar(
          content: Text('Data Successfully Added'),
        ));
        navigator.pushNamedAndRemoveUntil(AppRoutes.homePage, (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final focusScope = FocusScope.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final viewModel = ref.watch(formCoalProvider);
    final stateDropdown = ref.watch(dropdownCoalData);
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: kPrimaryLight,
          ),
          const Center(
            child: CircleAvatar(
              radius: 150,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(
                AssetConstants.icPlan,
              ),
            ),
          ),
          Scaffold(
            floatingActionButton: _buildFAB(context, 'next-coal', () async {
              handleNextButton(viewModel, scaffoldMessenger, navigator);
            }, Icons.next_plan_rounded, 'Next'),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 8.0,
              leading: GestureDetector(
                onTap: () {
                  navigator.pop();
                },
                child: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              title: const Text('Tambah Data Produksi CO'),
            ),
            body: GestureDetector(
              onTap: () {
                focusScope.unfocus();
              },
              child: Stack(
                children: [
                  Container(
                    color: kPrimaryLight,
                  ),
                  const Center(
                    child: CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                        AssetConstants.icPlan,
                      ),
                    ),
                  ),
                  Form(
                      key: _formCoal,
                      child: stateDropdown.when(
                          data: (data) {
                            return _buildForm(context, true, viewModel, data!,
                                scaffoldMessenger, navigator, theme);
                          },
                          dataLoading: (dataLoading) {
                            return Shimmer(
                                child: _buildForm(
                                    context,
                                    false,
                                    viewModel,
                                    dataLoading!,
                                    scaffoldMessenger,
                                    navigator,
                                    theme),
                                gradient: shimmerGradient2);
                          },
                          error: (error) => CustomScrollView(
                                slivers: [
                                  CupertinoSliverRefreshControl(
                                    onRefresh: () => _fetchData(context, ref),
                                  ),
                                  SliverFillRemaining(
                                    child: Text(
                                      error,
                                      style: theme.textTheme.headline6,
                                    ),
                                  ),
                                ],
                              ))
                      // _buildForm(context, viewModel, scaffoldMessenger,
                      //     navigator, theme),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAB(BuildContext context, String heroTag,
      void Function()? onPressed, IconData icon, String label) {
    return FloatingActionButton.extended(
      heroTag: heroTag,
      isExtended: true,
      onPressed: onPressed,
      label: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: AppConstants.margin / 4,
          ),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildForm(
      BuildContext context,
      bool enabled,
      FormCoalViewModel viewModel,
      Map<String, dynamic> data,
      ScaffoldMessengerState scaffoldMessenger,
      NavigatorState navigator,
      ThemeData theme) {
    final activity = data["activity"];
    final loader = data["loader"];
    final problem = data["problem"];
    final hauler = data["hauler"];
    return ListView(
      padding: const EdgeInsets.fromLTRB(
          AppConstants.margin, AppConstants.margin, AppConstants.margin, 0),
      children: List.generate(
        9,
        (index) {
          List<String> label = [
            'Activity',
            'Material Code',
            'Date',
            'Distance (m)',
            'Shift',
            'Loader',
            'Hauler',
            'Masalah Produksi',
            'Deskripsi Masalah',
          ];
          List<Icon?> suffixIcon = [
            const Icon(Icons.arrow_drop_down_circle_rounded),
            null,
            const Icon(Icons.date_range_rounded),
            null,
            null,
            const Icon(Icons.arrow_drop_down_circle_rounded),
            const Icon(Icons.arrow_drop_down_circle_rounded),
            const Icon(Icons.arrow_drop_down_circle_rounded),
            null,
          ];
          return PrimaryColorOverride(
              child: CustomTextFormField(
                keyboardType: index == 3 || index == 4 || index == 7
                    ? TextInputType.number
                    : null,
                enabled: index == 1 ? false : enabled,
                filled: true,
                fillColor: theme.colorScheme.primaryContainer.withOpacity(0.6),
                onTap: () async {
                  viewModel.tapped();
                  if (index == 0) {
                    _focusNode[0].unfocus();
                    _controller[0].text = await viewModel.showDataSheet(
                        context, activity, viewModel, navigator);
                  }
                  if (index == 2) {
                    _focusNode[2].unfocus();
                    showDialouge(navigator, () async {
                      _controller[2].text = await viewModel.selectDate(
                          context, navigator, scaffoldMessenger);
                    });
                  }
                  if (index == 5) {
                    _focusNode[5].unfocus();
                    _controller[5].text = await viewModel.showDataLoader(
                        context, loader, viewModel, navigator);
                  }
                  if (index == 6) {
                    _focusNode[6].unfocus();
                    final isTambah =
                        await showCupertinoDialouge(navigator, viewModel);
                    if (isTambah != null) {
                      if (isTambah) {
                        final res = await navigator.pushNamed(
                          AppRoutes.formHaulerCoal,
                          arguments: hauler,
                        );
                        if (res != null) {
                          final data = res as List<Map<String, dynamic>>;
                          for (var item in data) {
                            _haulerDialogData.add(item);
                          }
                          _controller[6].text =
                              '${_haulerDialogData.length} Data Hauler';
                          viewModel.tapped();
                        }
                      }
                    }
                  }
                  if (index == 7) {
                    _focusNode[7].unfocus();
                    _controller[7].text = await viewModel.showDataProblem(
                        context, problem, viewModel, navigator);
                  }
                },
                suffixIcon: suffixIcon[index],
                controller: _controller[index],
                label: label[index],
                focusNode: _focusNode[index],
                delete: () {
                  _controller[index].clear();
                  if (index == 6) _haulerDialogData.clear();
                  viewModel.tapped();
                },
                validator: (data) => data == null || data.isEmpty
                    ? 'Please fill this form'
                    : null,
              ),
              color: kPrimaryText);
        },
      ),
    );
  }
}
