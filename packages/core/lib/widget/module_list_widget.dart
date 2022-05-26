import 'package:core/constants/app_constants.dart';
import 'package:core/viewmodel/home/home_viewmodel.dart';
import 'package:core/widget/content_neumorphism.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ModuleListWidget extends StatelessWidget {
  const ModuleListWidget(
      {Key? key, required this.viewModel, required this.data})
      : super(key: key);

  final HomeViewModel viewModel;
  final List<List<String>> data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final navigator = Navigator.of(context);
    return AnimationLimiter(
      child: SizedBox(
        height: size.height * 0.70,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
              vertical: AppConstants.margin,
              horizontal: AppConstants.margin / 2),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 675),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Container(
                    alignment: index % 2 == 0
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    padding: const EdgeInsets.only(bottom: AppConstants.margin),
                    child: NeumorphismCard(
                        viewModel: viewModel,
                        onTap: () async {
                          viewModel.onTap();
                          await Future.delayed(
                              const Duration(milliseconds: 50));
                          navigator.pushNamed(data[index][2]);
                          viewModel.onTap();
                        },
                        title: data[index][0]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
