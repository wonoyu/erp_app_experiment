import 'package:badges/badges.dart';
import 'package:core/constants/app_constants.dart';
import 'package:core/constants/colors.dart';
import 'package:core/constants/keys.dart';
import 'package:core/model/history/coal/hauler_model.dart';
import 'package:core/providers.dart';
import 'package:core/viewmodel/coal/form_coal_viewmodel.dart';
import 'package:core/widget/bottom_sheet_dropdown.dart';
import 'package:core/widget/custom_text_form_field.dart';
import 'package:core/widget/about_dialog_pop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsp_app1/routes.dart';

class FormCoalHauler extends ConsumerStatefulWidget {
  const FormCoalHauler({Key? key, required this.data}) : super(key: key);

  final dynamic data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormCoalHaulerState();
}

class _FormCoalHaulerState extends ConsumerState<FormCoalHauler> {
  final _controller = List.generate(3, (index) => TextEditingController());
  final _focusNode = List.generate(3, (index) => FocusNode());
  final _formCoalHauler = GlobalKey<FormState>(debugLabel: Keys.coalHaulerForm);

  List<Map<String, dynamic>> _data = [];

  Future<void> _showDataHauler(
    BuildContext context,
    List<HaulerModel> data,
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
                modalTitle: 'Hauler',
                data: temps,
                controller: controller,
                navigator: navigator,
              ),
            ));
    if (selected != null) {
      _controller[0].text = '${selected.value!} - ${selected.label!}';
      viewModel.tapped();
      // controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    final size = MediaQuery.of(context).size;
    final focusScope = FocusScope.of(context);
    final theme = Theme.of(context);
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
            backgroundColor: Colors.transparent,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Wrap(
              spacing: AppConstants.margin,
              children: [
                _buildFAB(context, 'tambah-hauler', () {
                  if (_formCoalHauler.currentState!.validate()) {
                    final haulerData = _controller[0].text.split(' - ');
                    _data.add({
                      'hauler_id': haulerData[0],
                      'hauler_name': haulerData[1],
                      'rit': _controller[1].text,
                      'produksi': _controller[2].text,
                    });
                    setState(() {});
                  }
                }, Icons.add_rounded, 'Tambah'),
                Badge(
                  padding: const EdgeInsets.all(AppConstants.margin / 3),
                  badgeContent: Text(
                    _data.length.toString(),
                    style: theme.textTheme.headline6,
                  ),
                  showBadge: _data.isNotEmpty,
                  child: _buildFAB(context, 'simpan-hauler', () async {
                    showCupertinoDialog(
                        context: context,
                        builder: (context) => AboutDialogPop(
                              title: "Data Hauler",
                              data: _data,
                              onTap: (index) {
                                viewModel.tapped();
                                _data.removeAt(index!);
                              },
                              actions: [
                                CupertinoDialogAction(
                                  child: const Text('Close'),
                                  onPressed: () => navigator.pop(),
                                )
                              ],
                            ));
                  }, Icons.visibility_rounded, 'Lihat'),
                ),
              ],
            ),
            appBar: AppBar(
              elevation: 8.0,
              leading: GestureDetector(
                onTap: () {
                  navigator.pop(_data);
                },
                child: const Icon(Icons.close),
              ),
              title: const Text('Tambah Data Hauler'),
            ),
            body: GestureDetector(
              onTap: (() => focusScope.unfocus()),
              child: Form(
                key: _formCoalHauler,
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(AppConstants.margin,
                      AppConstants.margin, AppConstants.margin, 0),
                  children: List.generate(3, (index) {
                    List<String> label = [
                      'Hauler',
                      'Rit',
                      'Produksi (BCM)',
                    ];
                    return PrimaryColorOverride(
                        child: CustomTextFormField(
                          keyboardType: TextInputType.number,
                          onTap: () {
                            if (index == 0) {
                              _focusNode[0].unfocus();
                              _showDataHauler(
                                  context, widget.data, viewModel, navigator);
                            }
                            viewModel.tapped();
                          },
                          label: label[index],
                          filled: true,
                          fillColor: theme.colorScheme.primaryContainer
                              .withOpacity(0.6),
                          suffixIcon: index == 0
                              ? const Icon(Icons.arrow_drop_down_circle_rounded)
                              : null,
                          controller: _controller[index],
                          focusNode: _focusNode[index],
                          validator: (data) => data == null || data.isEmpty
                              ? 'Please fill this form'
                              : null,
                        ),
                        color: kPrimaryText);
                  }),
                ),
              ),
            ),
          )
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
