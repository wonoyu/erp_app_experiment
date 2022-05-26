import 'package:flutter/material.dart';
import 'package:gsp_app1/view/auth/auth_widget.dart';
import 'package:gsp_app1/view/auth/login_page.dart';
import 'package:gsp_app1/view/form/coal/form_coal.dart';
import 'package:gsp_app1/view/form/coal/form_coal_hauler.dart';
import 'package:gsp_app1/view/form/coal/form_plan_co.dart';
import 'package:gsp_app1/view/history/coal_stock.dart';
import 'package:gsp_app1/view/home/home_page.dart';
import 'package:gsp_app1/view/home/no_screen_found.dart';

class AppRoutes {
  static const loginPage = '/login';
  static const homePage = '/home';
  static const viewCoal = '/viewCoal';
  static const formPlanCo = '/planCo';
  static const formCoal = '/formCoal';
  static const formHaulerCoal = 'formHaulerCoal';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.loginPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const LoginPage(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.homePage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const MyHomePage(),
          settings: settings,
          fullscreenDialog: true,
        );
      case '/dashboard/eng-pro/production-coal':
        return MaterialPageRoute<dynamic>(
            builder: (_) => const CoalStockHistory(),
            settings: settings,
            fullscreenDialog: true);
      case AppRoutes.formPlanCo:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const FormPlanCo(),
            settings: settings,
            fullscreenDialog: true);
      case AppRoutes.formCoal:
        return MaterialPageRoute(
            builder: (_) => const FormCoal(),
            settings: settings,
            fullscreenDialog: true);
      case AppRoutes.formHaulerCoal:
        return MaterialPageRoute(
            builder: (_) => FormCoalHauler(
                  data: args,
                ),
            settings: settings,
            fullscreenDialog: true);
      default:
        return MaterialPageRoute<dynamic>(
            settings: settings,
            fullscreenDialog: false,
            builder: (_) => const NoScreen());
    }
  }
}
