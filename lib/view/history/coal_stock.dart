import 'package:core/constants/app_constants.dart';
import 'package:core/constants/colors.dart';
import 'package:core/providers.dart';
import 'package:core/widget/custom_popmenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsp_app1/routes.dart';
import 'package:gsp_app1/view/history/coal_data_table.dart';
import 'package:gsp_app1/view/shimmers/shimmer_appbar_sub.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class CoalStockHistory extends ConsumerStatefulWidget {
  const CoalStockHistory({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CoalStockHistoryState();
}

class _CoalStockHistoryState extends ConsumerState<CoalStockHistory> {
  Future<void> _fetchData(BuildContext context, WidgetRef ref) async {
    final coalModel = ref.read(coalModelProvider.notifier);
    final date = ref.read(dateProvider).dateTime;
    print(date);
    await coalModel.fetchCoal(date);
  }

  Future<void> pickDateRange(BuildContext context, WidgetRef ref) async {
    final dateModel = ref.read(dateProvider);
    final newDateRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        initialDateRange: dateModel.dateTime,
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                primary: kPrimaryLight,
                onPrimary: kPrimaryText,
              ),
            ),
            child: child!,
          );
        });

    if (newDateRange != null) {
      dateModel.selectDateTimeRange(newDateRange);
      await _fetchData(context, ref);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.fixed, content: Text('No date selected')));
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData(context, ref);
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    final theme = Theme.of(context);
    final state = ref.watch(coalModelProvider);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: state.maybeWhen(
          dataLoading: (data) {
            return Shimmer(
              gradient: shimmerGradient2,
              child: FloatingActionButton.extended(
                backgroundColor: Colors.white,
                isExtended: true,
                onPressed: () {
                  navigator.pushNamed(AppRoutes.formPlanCo);
                },
                label: Row(
                  children: const [
                    Icon(Icons.add),
                    SizedBox(
                      width: AppConstants.margin / 4,
                    ),
                    Text('Add Data'),
                  ],
                ),
              ),
            );
          },
          orElse: () => FloatingActionButton.extended(
            heroTag: 'coal-stock',
            isExtended: true,
            onPressed: () {
              navigator.pushNamed(AppRoutes.formPlanCo);
            },
            label: Row(
              children: const [
                Icon(Icons.add),
                SizedBox(
                  width: AppConstants.margin / 4,
                ),
                Text('Add Data'),
              ],
            ),
          ),
        ),
        backgroundColor: theme.colorScheme.primary,
        appBar: state.maybeWhen(
            data: (data) {
              return _buildAppBar(context, ref);
            },
            dataLoading: (dataLoading) => AppBar(
                  elevation: 0.0,
                  automaticallyImplyLeading: false,
                  centerTitle: false,
                  title: const ShimmerAppbarSub(),
                ),
            orElse: () => _buildAppBar(context, ref)),
        body: state.when(data: (data) {
          if (data.isEmpty) {
            return _buildNoData(
                context, 'Data tidak ditemukan pada tanggal ini', theme, ref);
          } else {
            return CoalDataTable(
              data: data,
            );
          }
        }, dataLoading: (dataLoading) {
          return Center(
            child: Shimmer(
                gradient: shimmerGradient2,
                child: CoalDataTable(data: dataLoading)),
          );
        }, error: (error) {
          return _buildNoData(context, error, theme, ref);
        }),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, WidgetRef ref) {
    final navigator = Navigator.of(context);
    final dateModel = ref.read(dateProvider);
    final startDate = DateFormat(TimeConstants.dateFormatNoHour)
        .format(dateModel.dateTime.start);
    final endDate = DateFormat(TimeConstants.dateFormatNoHour)
        .format(dateModel.dateTime.end);
    return AppBar(
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {
          navigator.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      title: ListTile(
        title: const Text('Date Filter : '),
        subtitle: Text('$startDate - $endDate'),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const CupertinoActivityIndicator(
                radius: 30.0,
                color: kSecondaryColor,
              ),
            ).timeout(const Duration(milliseconds: 500), onTimeout: () {
              navigator.pop();
            }).then((value) {
              return pickDateRange(context, ref);
            });
          },
          child: const Icon(Icons.date_range_rounded),
        ),
        CustomPopMenu(fetchData: () {
          _fetchData(context, ref);
        }),
      ],
    );
  }

  Widget _buildNoData(
      BuildContext context, String bottom, ThemeData theme, WidgetRef ref) {
    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            await _fetchData(context, ref);
          },
        ),
        SliverFillRemaining(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 150,
                  backgroundColor: kPrimaryLight,
                  backgroundImage: AssetImage(
                    AssetConstants.noData,
                  ),
                ),
                const SizedBox(
                  height: AppConstants.margin / 2,
                ),
                Text(
                  bottom,
                  style:
                      theme.textTheme.subtitle1!.copyWith(color: kPrimaryText),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
