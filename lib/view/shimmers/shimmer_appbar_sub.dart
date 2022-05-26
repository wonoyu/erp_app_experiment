import 'package:core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAppbarSub extends StatelessWidget {
  const ShimmerAppbarSub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: shimmerGradient2,
      child: ListTile(
        trailing: CircleAvatar(backgroundColor: Colors.white),
        title: Container(
          height: 30,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
