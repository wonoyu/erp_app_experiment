import 'package:core/constants/app_constants.dart';
import 'package:core/constants/keys.dart';
import 'package:core/widget/primary_button.dart';
import 'package:core/widget/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeDialog extends ConsumerStatefulWidget {
  const TimeDialog({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TimeDialogState();
}

class _TimeDialogState extends ConsumerState<TimeDialog> {
  final focusH = FocusNode();
  final focusM = FocusNode();
  final focusS = FocusNode();
  TextEditingController controllerH = TextEditingController();
  TextEditingController controllerM = TextEditingController();
  TextEditingController controllerS = TextEditingController();
  final _formTime = GlobalKey<FormState>(debugLabel: Keys.timeForm);

  @override
  void dispose() {
    focusH.dispose();
    focusM.dispose();
    focusS.dispose();
    controllerH.dispose();
    controllerM.dispose();
    controllerS.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final navigator = Navigator.of(context);
    return Dialog(
      backgroundColor: theme.colorScheme.primaryVariant,
      child: Wrap(
        runSpacing: AppConstants.margin / 3,
        children: [
          ListTile(
            tileColor: theme.colorScheme.secondary,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))),
            title: Text(
              'Time Details',
              style: theme.textTheme.headline6,
            ),
          ),
          ListTile(
            title: Form(
              key: _formTime,
              child: Wrap(
                children: [
                  _buildForm(theme, 'Hours', focusH, controllerH, (value) {
                    focusH.unfocus();
                    focusM.requestFocus();
                  }, (value) {
                    if (controllerH.text.isEmpty ||
                        int.parse(controllerH.text) > 24) return '00-23';
                    return null;
                  }),
                  _buildForm(theme, 'Minutes', focusM, controllerM, (value) {
                    focusM.unfocus();
                    focusS.requestFocus();
                  }, (value) {
                    if (controllerM.text.isEmpty ||
                        int.parse(controllerM.text) > 60) return '00-59';
                    return null;
                  }),
                  _buildForm(theme, 'Seconds', focusS, controllerS, (value) {
                    focusS.unfocus();
                  }, (value) {
                    if (controllerS.text.isEmpty ||
                        int.parse(controllerS.text) > 60) return '00-59';
                    return null;
                  }),
                ],
              ),
            ),
          ),
          ListTile(
            trailing: ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: [
                SecondaryButton(
                    title: 'Cancel',
                    onPressed: () {
                      navigator.pop();
                    }),
                PrimaryButton(
                    title: 'Done',
                    onPressed: () {
                      if (_formTime.currentState!.validate()) {
                        navigator.pop(
                            "${controllerH.text}:${controllerM.text}:${controllerS.text}");
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm(
      ThemeData theme,
      String label,
      FocusNode focusNode,
      TextEditingController controller,
      Function(String value) onChanged,
      String? Function(String? value) validator) {
    return Container(
        width: 80,
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.margin / 4),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) {
            if (value.length == 2) onChanged(value);
          },
          controller: controller,
          focusNode: focusNode,
          style: theme.textTheme.subtitle1,
          maxLength: 2,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          maxLines: 1,
          keyboardType: TextInputType.datetime,
          validator: (value) {
            return validator(value);
          },
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            counterText: '',
            labelText: label,
            labelStyle: theme.textTheme.subtitle1!.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ));
  }
}
