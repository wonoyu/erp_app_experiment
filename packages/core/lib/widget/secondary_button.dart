import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(title),
      style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all(Theme.of(context).colorScheme.secondary),
      ),
      onPressed: onPressed,
    );
  }
}
