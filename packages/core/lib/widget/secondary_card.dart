import 'package:core/constants/colors.dart';
import 'package:flutter/material.dart';

class SecondaryCard extends StatelessWidget {
  const SecondaryCard({Key? key, required this.child, this.height})
      : super(key: key);

  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        color: kSecondaryLight,
        child: child,
      ),
    );
  }
}
