import 'dart:ui';

import 'package:core/constants/app_constants.dart';
import 'package:core/constants/colors.dart';
import 'package:core/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeFrontChild extends ConsumerWidget {
  const HomeFrontChild({Key? key, required this.toggleDrawer})
      : super(key: key);

  final VoidCallback toggleDrawer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(backProvider);
    final navigator = Navigator.of(context);
    final theme = Theme.of(context);
    const borderRadius = BorderRadius.only(
        topLeft: Radius.circular(20.0), bottomLeft: Radius.circular(20.0));
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.10),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.90,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
          ),
          child: GestureDetector(
            onTap: toggleDrawer,
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: model.isToggled ? 0 : 2,
                    sigmaY: model.isToggled ? 0 : 2,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: borderRadius,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    border: Border.all(color: Colors.white70.withOpacity(0.4)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.4),
                        Colors.white.withOpacity(0.1)
                      ],
                    ),
                  ),
                  child: ListView(
                    children: [
                      ListTile(
                        horizontalTitleGap: AppConstants.margin,
                        leading: IconButton(
                          visualDensity: VisualDensity.compact,
                          padding: const EdgeInsets.all(0.0),
                          onPressed: () {},
                          icon: Icon(
                            model.isToggled
                                ? Icons.arrow_circle_left_rounded
                                : Icons.punch_clock,
                            size: model.isToggled ? 50 : 30,
                          ),
                        ),
                        title: Text(
                          'Pending Uploads',
                          style: theme.textTheme.headline5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
