import 'package:core/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:gsp_app1/routes.dart';
import 'package:gsp_app1/view/auth/auth_widget.dart';
import 'package:gsp_app1/view/auth/login_page.dart';
import 'package:gsp_app1/view/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GSP App',
      theme: themeData,
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
      home: AuthWidget(
        notSignedIn: (_) => const LoginPage(),
        signedIn: (_) => const MyHomePage(),
      ),
    );
  }
}
