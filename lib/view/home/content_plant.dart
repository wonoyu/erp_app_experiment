import 'package:core/constants/app_constants.dart';
import 'package:core/constants/colors.dart';
import 'package:core/widget/primary_button.dart';
import 'package:core/widget/primary_card.dart';
import 'package:core/widget/secondary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContentPlant extends ConsumerWidget {
  const ContentPlant(
      {Key? key,
      required this.size,
      required this.theme,
      required this.navigator})
      : super(key: key);

  final Size size;
  final ThemeData theme;
  final NavigatorState navigator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: size.width,
      child: PrimaryCard(
        child: Column(
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(AssetConstants.planty),
                  ),
                  const SizedBox(
                    width: AppConstants.margin,
                  ),
                  Text(
                    'Data Plant',
                    style: theme.textTheme.headline6!,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(AppConstants.margin / 3),
              height: size.height * 0.20,
              width: size.width,
              child: GridView.count(
                childAspectRatio: 4 / 3.5,
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: AppConstants.margin / 4,
                mainAxisSpacing: AppConstants.margin / 3,
                children: [
                  SecondaryCard(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Laporan Kerusakan',
                            style: theme.textTheme.subtitle1,
                            textAlign: TextAlign.center,
                          ),
                          PrimaryButton(title: 'Lihat Data', onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
