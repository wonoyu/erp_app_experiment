import 'package:core/constants/app_constants.dart';
import 'package:core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.focusNode,
      this.keyboardType,
      this.validator,
      this.obscured = false,
      this.isPassword = false,
      this.filled = false,
      this.fillColor,
      this.enabled = true,
      this.delete,
      this.icon,
      this.suffixIcon,
      this.toggle,
      this.onTap})
      : super(key: key);

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool enabled;
  final FocusNode focusNode;
  final String label;
  final String? Function(String?)? validator;
  final bool obscured;
  final bool isPassword;
  final bool filled;
  final Color? fillColor;
  final VoidCallback? delete;
  final Widget? icon;
  final Widget? suffixIcon;
  final Function()? toggle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.margin / 1.5),
      child: TextFormField(
        onTap: onTap,
        enabled: enabled,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
            color: focusNode.hasFocus
                ? theme.colorScheme.secondary
                : unfocusedColor),
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        obscureText: obscured,
        decoration: InputDecoration(
            filled: filled,
            fillColor: filled ? fillColor : null,
            prefixIcon: icon,
            suffixIcon: isPassword
                ? GestureDetector(
                    onTap: toggle,
                    child: Icon(obscured
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded),
                  )
                : suffixIcon != null
                    ? GestureDetector(
                        onTap: () {
                          if (controller.text.isNotEmpty) delete?.call();
                        },
                        child: controller.text.isNotEmpty
                            ? const Icon(Icons.close_outlined)
                            : suffixIcon,
                      )
                    : null,
            labelText: label,
            labelStyle: TextStyle(
              color: focusNode.hasPrimaryFocus
                  ? Theme.of(context).colorScheme.secondary
                  : unfocusedColor,
            )),
        focusNode: focusNode,
      ),
    );
  }
}

class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride(
      {Key? key, required this.color, required this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: color),
      ),
    );
  }
}

class PrimaryColorOverride extends StatelessWidget {
  const PrimaryColorOverride(
      {Key? key, required this.child, required this.color})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: color, onPrimary: color),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(
              color: color,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: color),
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
      ),
    );
  }
}
