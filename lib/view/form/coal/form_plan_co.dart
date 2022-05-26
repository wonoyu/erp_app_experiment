import 'package:core/constants/app_constants.dart';
import 'package:core/constants/colors.dart';
import 'package:core/constants/keys.dart';
import 'package:core/providers.dart';
import 'package:core/viewmodel/coal/form_coal_viewmodel.dart';
import 'package:core/widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsp_app1/routes.dart';

class FormPlanCo extends ConsumerStatefulWidget {
  const FormPlanCo({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormPlanCoState();
}

class _FormPlanCoState extends ConsumerState<FormPlanCo> {
  final _controllerDate = TextEditingController();
  final _focusNodeDate = FocusNode();
  final _controllerPlan = TextEditingController();
  final _focusNodePlan = FocusNode();
  final _formPlanCoal = GlobalKey<FormState>(debugLabel: Keys.coalPlanForm);

  @override
  void dispose() {
    _controllerDate.dispose();
    _focusNodeDate.dispose();
    _controllerPlan.dispose();
    _focusNodePlan.dispose();
    super.dispose();
  }

  Future<dynamic> _selectDate(BuildContext context, NavigatorState navigator,
      ScaffoldMessengerState scaffoldMessenger) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));
    // final time =
    //     await showDialog(context: context, builder: (context) => TimeDialog());
    // if (picked != null && time != null)
    if (picked != null) {
      String? formattedPicked =
          picked.toString().substring(0, picked.toString().indexOf(" "));
      // if (formattedPicked.isNotEmpty && time.isNotEmpty)
      if (formattedPicked.isNotEmpty) {
        _controllerDate.text = formattedPicked;
      }
    } else {
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('No date selected'),
      ));
    }
  }

  Future<void> handleNextButton(
      FormCoalViewModel viewModel,
      ScaffoldMessengerState scaffoldMessenger,
      NavigatorState navigator) async {
    if (_formPlanCoal.currentState!.validate()) {
      await viewModel.postPlanCoal(
          _controllerDate.text, num.parse(_controllerPlan.text));
      if (viewModel.error == null) {
        scaffoldMessenger.showSnackBar(
            const SnackBar(content: Text('Data berhasil ditambahkan')));
        navigator.pushNamed(AppRoutes.formCoal);
      } else if (viewModel.error != null) {
        scaffoldMessenger
            .showSnackBar(SnackBar(content: Text(viewModel.error)));
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
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Wrap(
              spacing: AppConstants.margin,
              children: [
                _buildFAB(context, 'already-coal', () {
                  navigator.pushNamed(AppRoutes.formCoal);
                }, Icons.done_rounded, 'Sudah ada plan'),
                _buildFAB(context, 'next-coal', () async {
                  handleNextButton(viewModel, scaffoldMessenger, navigator);
                }, Icons.next_plan_rounded, 'Kirim'),
              ],
            ),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 8.0,
              leading: GestureDetector(
                onTap: () {
                  navigator.pop();
                },
                child: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              title: const Text('Tambah Data Plan CO'),
            ),
            body: GestureDetector(
              onTap: () {
                focusScope.unfocus();
              },
              child: Form(
                key: _formPlanCoal,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.margin,
                      vertical: AppConstants.margin / 2),
                  children: [
                    PrimaryColorOverride(
                      color: kPrimaryText,
                      child: CustomTextFormField(
                        onTap: () {
                          viewModel.tapped();
                          _focusNodeDate.unfocus();
                          showDialog(
                            context: context,
                            builder: (context) =>
                                const CupertinoActivityIndicator(
                              radius: 30.0,
                              color: kSecondaryColor,
                            ),
                          )
                              .timeout(const Duration(milliseconds: 500),
                                  onTimeout: () => navigator.pop())
                              .then((value) => _selectDate(
                                  context, navigator, scaffoldMessenger));
                          // _selectDate(context, navigator, scaffoldMessenger);
                        },
                        suffixIcon: const Icon(Icons.date_range_rounded),
                        controller: _controllerDate,
                        label: 'Date',
                        focusNode: _focusNodeDate,
                        validator: (data) => data == null || data.isEmpty
                            ? 'Please fill this form'
                            : null,
                      ),
                    ),
                    PrimaryColorOverride(
                      color: kPrimaryText,
                      child: CustomTextFormField(
                        keyboardType: TextInputType.number,
                        onTap: () => viewModel.tapped(),
                        controller: _controllerPlan,
                        label: 'Plan',
                        focusNode: _focusNodePlan,
                        validator: (data) => data == null || data.isEmpty
                            ? 'Please fill this form'
                            : null,
                      ),
                    ),
                  ],
                ),
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
}
