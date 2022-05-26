import 'package:core/constants/app_constants.dart';
import 'package:core/constants/colors.dart';
import 'package:core/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomPopMenu extends ConsumerWidget {
  const CustomPopMenu({Key? key, required this.fetchData}) : super(key: key);

  final Function() fetchData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateModel = ref.read(dateProvider);
    final title = [
      'Today',
      'Yesterday',
      'This Week',
      'Last Week',
      'This Month',
      'Last Month',
    ];

    return PopupMenuButton(
      icon: const Icon(Icons.more_horiz),
      color: kSecondaryLight,
      elevation: 40,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      enabled: true,
      onSelected: (value) {
        if (value == 1) {
          dateModel.selectDateTimeRange(DateTimeRange(
              start: TimeConstants.today, end: TimeConstants.endToday));
          fetchData();
        }
        if (value == 2) {
          dateModel.selectDateTimeRange(DateTimeRange(
              start: TimeConstants.yesterday, end: TimeConstants.endYesterday));
          fetchData();
        }
        if (value == 3) {
          dateModel.selectDateTimeRange(DateTimeRange(
              start: TimeConstants.weekStart, end: TimeConstants.weekEnd));
          fetchData();
        }
        if (value == 4) {
          dateModel.selectDateTimeRange(DateTimeRange(
              start: TimeConstants.lastWeekStart,
              end: TimeConstants.lastWeekEnd));
          fetchData();
        }
        if (value == 5) {
          dateModel.selectDateTimeRange(DateTimeRange(
              start: TimeConstants.thisMonthStart,
              end: TimeConstants.thisMonthEnd));
          fetchData();
        }
        if (value == 6) {
          dateModel.selectDateTimeRange(DateTimeRange(
              start: TimeConstants.lastMonthStart,
              end: TimeConstants.lastMonthEnd));
          fetchData();
        }
      },
      itemBuilder: (context) => List.generate(
        title.length,
        (index) => PopupMenuItem(
          child: Text(title[index]),
          value: index + 1,
        ),
      ),
    );
  }
}
