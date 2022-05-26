import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(title),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(6.0),
      ),
      onPressed: onPressed,
    );
  }
}
