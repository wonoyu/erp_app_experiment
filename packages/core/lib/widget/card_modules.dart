import 'dart:ui';

import 'package:core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CardModules extends StatelessWidget {
  const CardModules(
      {Key? key,
      required this.title,
      required this.onSelectedItemChanged,
      required this.controller,
      required this.itemExtent,
      this.diameterRatio = 5})
      : super(key: key);

  final List<String> title;
  final void Function(int) onSelectedItemChanged;
  final FixedExtentScrollController controller;
  final double itemExtent;
  final double diameterRatio;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20.0);
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(secondary: Colors.white54)),
      child: Container(
        height: size.height * 0.20,
        decoration: BoxDecoration(
            borderRadius: borderRadius,
            image: const DecorationImage(
                fit: BoxFit.cover, image: AssetImage(AssetConstants.imBgCard))),
        child: RotatedBox(
          quarterTurns: 3,
          child: ListWheelScrollView.useDelegate(
            onSelectedItemChanged: onSelectedItemChanged,
            controller: controller,
            itemExtent: itemExtent,
            diameterRatio: diameterRatio,
            physics: const FixedExtentScrollPhysics(),
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: title.length,
              builder: (context, index) {
                return RotatedBox(
                  quarterTurns: 1,
                  child: TopCard(
                      assetIcon: AssetConstants.cart, title: title[index]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class TopCard extends StatelessWidget {
  const TopCard({Key? key, required this.assetIcon, required this.title})
      : super(key: key);

  final String assetIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(20.0);
    final size = MediaQuery.of(context).size;
    return Hero(
      tag: title,
      child: Container(
        decoration: BoxDecoration(borderRadius: borderRadius),
        height: size.height * 0.20,
        width: size.width,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 2,
              ),
              child: Container(
                decoration: BoxDecoration(borderRadius: borderRadius),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(AppConstants.margin / 2),
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                border: Border.all(color: Colors.white.withOpacity(0.2)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.4),
                    Colors.white.withOpacity(0.1)
                  ],
                ),
              ),
              child: Center(
                  child: ListTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(assetIcon)),
                title: Text(
                  title,
                  style: theme.textTheme.headline5,
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
