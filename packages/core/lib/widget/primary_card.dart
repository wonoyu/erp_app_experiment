import 'package:core/constants/colors.dart';
import 'package:flutter/material.dart';

class PrimaryCard extends StatelessWidget {
  const PrimaryCard({Key? key, required this.child, this.height})
      : super(key: key);

  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        elevation: 8.0,
        color: kBackgroundTransparent,
        child: child,
      ),
    );
  }
}
