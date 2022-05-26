import 'package:core/constants/app_constants.dart';
import 'package:core/viewmodel/home/home_viewmodel.dart';
import 'package:flutter/material.dart';

class NeumorphismCard extends StatelessWidget {
  const NeumorphismCard({
    Key? key,
    required this.viewModel,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final HomeViewModel viewModel;
  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        onTap?.call();
      },
      onLongPress: () {
        // viewModel.onLongPress();
      },
      onLongPressEnd: (details) {
        // viewModel.onLongPressCancel();
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 500),
        child: Stack(
          children: [
            Container(
              child: Wrap(
                spacing: AppConstants.margin / 3,
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                children: [
                  Text(title),
                  Text(
                    'Tap to View Data',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w700),
                  )
                ],
              ),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: viewModel.isPressed
                          ? Colors.grey.shade200
                          : Colors.grey.shade300),
                  boxShadow: viewModel.isPressed
                      ? []
                      : [
                          BoxShadow(
                              color: Colors.grey.shade500,
                              offset: Offset(4, 4),
                              spreadRadius: 1,
                              blurRadius: 15),
                          const BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4, -4),
                              spreadRadius: 1,
                              blurRadius: 15)
                        ]),
            ),
          ],
        ),
      ),
    );
  }
}
