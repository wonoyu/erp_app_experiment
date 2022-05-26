import 'dart:async';

import 'package:core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gsp_app1/routes.dart';

class NoScreen extends StatefulWidget {
  const NoScreen({Key? key}) : super(key: key);

  @override
  State<NoScreen> createState() => _NoScreenState();
}

class _NoScreenState extends State<NoScreen>
    with SingleTickerProviderStateMixin {
  int _elapsed = 5;
  late final Ticker _ticker;
  @override
  void initState() {
    super.initState();
    // 3. initialize Ticker
    // ignore: unnecessary_this
    _ticker = this.createTicker((elapsed) {
      // 4. update state
      setState(() {
        _elapsed = 5 - elapsed.inSeconds;
      });
      if (elapsed.inSeconds == 5) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRoutes.homePage, (route) => false);
      }
    });
    // 5. start ticker
    _ticker.start();
  }

  @override
  void dispose() {
    // 6. don't forget to dispose it
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRoutes.homePage, (route) => false),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(AssetConstants.notFound),
            const SizedBox(
              height: AppConstants.margin / 2,
            ),
            const Text('Page not found...'),
            const SizedBox(
              height: AppConstants.margin / 2,
            ),
            Text('Returning to home in $_elapsed')
          ]),
        ),
      ),
    );
  }
}
