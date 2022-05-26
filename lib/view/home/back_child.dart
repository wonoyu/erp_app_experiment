import 'dart:ui';

import 'package:core/constants/app_constants.dart';
import 'package:core/utils/secure_storage.dart';
import 'package:core/widget/content_neumorphism.dart';
import 'package:core/widget/card_modules.dart';
import 'package:core/constants/colors.dart';
import 'package:core/model/login_model.dart';
import 'package:core/providers.dart';
import 'package:core/model/module_model.dart';
import 'package:core/viewmodel/home/home_viewmodel.dart';
import 'package:core/widget/module_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gsp_app1/routes.dart';
import 'package:gsp_app1/view/home/assymetric_view.dart';
import 'package:gsp_app1/view/home/content_k3l.dart';
import 'package:gsp_app1/view/home/content_plant.dart';
import 'package:gsp_app1/view/home/content_produksi.dart';
import 'package:gsp_app1/view/shimmers/shimmer_appbar_sub.dart';
import 'package:shimmer/shimmer.dart';

class HomeBackChild extends ConsumerStatefulWidget {
  const HomeBackChild({Key? key, required this.data}) : super(key: key);

  final LoginModel? data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeBackChildState();
}

class _HomeBackChildState extends ConsumerState<HomeBackChild> {
  final FixedExtentScrollController controller = FixedExtentScrollController();
  int indexContent = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final modulesVM = ref.watch(modulesProvider);
    final backViewModel = ref.watch(backProvider);
    final navigator = Navigator.of(context);
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: modulesVM.when(loaded: (data) {
        return _buildAppBar(context, backViewModel, theme, navigator, data);
      }, error: (error) {
        return _buildAppBar(context, backViewModel, theme, navigator, []);
      }, loading: (loading) {
        return AppBar(
          elevation: 8.0,
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: const ShimmerAppbarSub(),
        );
      }),
      body: modulesVM.when(loaded: (data) {
        return _buildBody(context, theme, navigator, size, backViewModel, data);
      }, error: (error) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (error == 'Your session is expired, please re-login') {
            await StorageHelper().deleteDataUser();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(error),
            ));
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRoutes.loginPage, (route) => false);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(error),
            ));
          }
        });

        return _buildBody(context, theme, navigator, size, backViewModel, []);
      }, loading: (loading) {
        return Padding(
          padding: const EdgeInsets.all(AppConstants.margin),
          child: Column(
            children: [
              Shimmer(
                  child: CardModules(
                    title: const [],
                    controller: controller,
                    onSelectedItemChanged: (index) {},
                    itemExtent: 20,
                  ),
                  gradient: shimmerGradient2),
              const SizedBox(
                height: AppConstants.margin,
              ),
              Shimmer(
                child: NeumorphismCard(
                    viewModel: backViewModel, onTap: () {}, title: 'error'),
                gradient: shimmerGradient2,
              ),
              const SizedBox(
                height: AppConstants.margin,
              ),
              Shimmer(
                child: NeumorphismCard(
                    viewModel: backViewModel, onTap: () {}, title: 'error'),
                gradient: shimmerGradient2,
              ),
            ],
          ),
        );
      }),
    );
  }

  PreferredSizeWidget _buildAppBar(
      BuildContext context,
      HomeViewModel backViewModel,
      ThemeData theme,
      NavigatorState navigator,
      List<ModuleModel> data) {
    return AppBar(
      elevation: 8.0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Wrap(
        spacing: AppConstants.margin / 3,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            widget.data?.data?.user?.companyName ?? "",
            style: theme.textTheme.subtitle1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 25,
            child: VerticalDivider(
              thickness: 1.5,
              width: 8,
              color: Colors.white,
            ),
          ),
          Text(
            'Pilih Site : ',
            style: theme.textTheme.subtitle1,
          ),
          SizedBox(
            height: 30,
            width: 50,
            child: ListWheelScrollView.useDelegate(
                diameterRatio: 10,
                perspective: 0.001,
                squeeze: 0.5,
                itemExtent: 20,
                physics: const FixedExtentScrollPhysics(),
                onSelectedItemChanged: (index) {
                  backViewModel
                      .setSite(widget.data!.data!.user!.companySite![index]);
                },
                childDelegate: ListWheelChildBuilderDelegate(
                    childCount:
                        widget.data?.data?.user?.companySite?.length ?? 1,
                    builder: (context, index) => Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.data?.data?.user?.companySite?[index].name ??
                                "",
                            style: theme.textTheme.subtitle1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))),
          ),
        ],
      ),
      actions: [
        CupertinoButton(
            child: const Icon(
              Icons.settings,
              color: kPrimaryText,
            ),
            onPressed: () async {
              final isLogout = await showCupertinoModalPopup<int>(
                  context: context,
                  builder: (context) =>
                      _buildDrawer(context, theme, navigator));
              if (isLogout == 1) {
                await backViewModel.logout();
                showDialog(
                  context: context,
                  builder: (context) => const CupertinoActivityIndicator(
                    radius: 30.0,
                    color: kSecondaryColor,
                  ),
                ).timeout(const Duration(milliseconds: 500), onTimeout: () {
                  Navigator.of(context).pop();
                }).then((value) {
                  return navigator.pushNamedAndRemoveUntil(
                      AppRoutes.loginPage, (route) => false);
                });
              }
            }),
      ],
    );
  }

  Widget _buildBody(
      BuildContext context,
      ThemeData theme,
      NavigatorState navigator,
      Size size,
      HomeViewModel backViewModel,
      List<ModuleModel> data) {
    final borderRadius = BorderRadius.circular(20.0);
    final moduleName = data.map((e) => e.moduleName!).toList();
    final subModuleData = data.map((e) => e.subModuleData).toList();
    final firstSplit = subModuleData[indexContent]!.split("|||");
    final secondSplit = firstSplit.map((e) => e.split("||")).toList();
    return Container(
      height: size.height,
      // width: size.width,
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(AppConstants.margin),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardModules(
            title: moduleName,
            controller: controller,
            onSelectedItemChanged: (index) {
              setState(() {});
              indexContent = index;
            },
            itemExtent: size.width,
          ),
          ModuleListWidget(
            data: secondSplit,
            viewModel: backViewModel,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(
      BuildContext context, ThemeData theme, NavigatorState navigator) {
    return CupertinoTheme(
      data: const CupertinoThemeData(),
      child: CupertinoActionSheet(
        title: const CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 40,
          child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(AssetConstants.icProfile)),
        ),
        message: Wrap(
            runAlignment: WrapAlignment.center,
            spacing: AppConstants.margin / 3,
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.vertical,
            children: [
              Text(
                widget.data?.data?.user?.fullName ?? "",
                style: const TextStyle(fontSize: 20),
              ),
              Text(widget.data?.data?.user?.email ?? "")
            ]),
        actions: [
          CupertinoActionSheetAction(
              onPressed: () => navigator.pop(1), child: const Text('Logout')),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () => navigator.pop(0),
          child: const Text('Cancel'),
        ),
      ),
    );
  }
}
