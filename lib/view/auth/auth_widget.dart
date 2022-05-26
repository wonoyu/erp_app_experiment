import 'package:core/constants/app_constants.dart';
import 'package:core/constants/colors.dart';
import 'package:core/model/login_model.dart';
import 'package:core/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:gsp_app1/routes.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget(
      {Key? key, required this.signedIn, required this.notSignedIn})
      : super(key: key);
  final WidgetBuilder notSignedIn;
  final WidgetBuilder signedIn;

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  LoginModel? data;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  void getToken() {
    final navigator = Navigator.of(context);
    StorageHelper().getDataUser().then((value) {
      setState(() {
        data = value;
      });
    }).whenComplete(() {
      if (data == null) {
        Future.delayed(const Duration(seconds: 1, milliseconds: 500))
            .whenComplete(() => navigator.pushReplacementNamed(
                  AppRoutes.loginPage,
                ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return data == null
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AssetConstants.icApps),
                  const SizedBox(
                    height: AppConstants.margin / 2,
                  ),
                  Text(
                    'ERP System',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: kSecondaryColor),
                  ),
                ],
              ),
            ),
          )
        : _isLogin(context, data?.data?.token);
    // return Visibility(
    //   visible: data == null,
    //   replacement: _isLogin(context, data?.data?.token),
    //   child: Center(
    //     child: Image.asset(AssetConstants.splash, fit: BoxFit.fitWidth,),
    //   ),
    // );
  }

  Widget _isLogin(BuildContext context, String? token) {
    if (token != null) {
      return widget.signedIn(context);
    }
    return widget.notSignedIn(context);
  }
}
