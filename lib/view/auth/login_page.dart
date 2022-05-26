import 'package:core/constants/app_constants.dart';
import 'package:core/constants/colors.dart';
import 'package:core/constants/keys.dart';
import 'package:core/providers.dart';
import 'package:core/viewmodel/login/login_viewmodel.dart';
import 'package:core/widget/custom_text_form_field.dart';
import 'package:core/widget/primary_button.dart';
import 'package:core/widget/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsp_app1/routes.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _formLogin = GlobalKey<FormState>(debugLabel: Keys.loginForm);

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginViewModel = ref.watch(loginProvider);
    // ref.listen<LoginViewModel>(loginProvider, (_, model) async {
    //   if (model.error != null) {
    //     scaffoldMessenger.showSnackBar(SnackBar(content: Text(model.error)));
    //   }
    // });
    return _buildPageContents(loginViewModel);
  }

  Widget _buildPageContents(LoginViewModel viewModel) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final focusScope = FocusScope.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => focusScope.unfocus(),
        child: SafeArea(
            child: Form(
          key: _formLogin,
          child: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: AppConstants.margin),
            children: [
              const SizedBox(
                height: AppConstants.margin * 3,
              ),
              Column(
                children: <Widget>[
                  AspectRatio(
                      aspectRatio: 14.0 / 9.0,
                      child: Image.asset(
                        AssetConstants.icLogin,
                        colorBlendMode: BlendMode.color,
                        gaplessPlayback: true,
                        frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) {
                          if (wasSynchronouslyLoaded) {
                            return child;
                          } else {
                            return AnimatedOpacity(
                              child: child,
                              opacity: frame == null ? 0 : 1,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeOut,
                            );
                          }
                        },
                      )),
                  Text(
                    'ERP System',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: kSecondaryColor),
                  ),
                  const SizedBox(
                    height: AppConstants.margin,
                  ),
                  AccentColorOverride(
                    color: kSecondaryColor,
                    child: CustomTextFormField(
                      onTap: () => viewModel.tapped(),
                      icon: const Icon(Icons.email_rounded),
                      controller: _usernameController,
                      keyboardType: TextInputType.emailAddress,
                      label: 'E-mail',
                      focusNode: _usernameFocusNode,
                      validator: (username) =>
                          username == null || username.isEmpty
                              ? 'Please enter your e-mail'
                              : null,
                    ),
                  ),
                  AccentColorOverride(
                    color: kSecondaryColor,
                    child: CustomTextFormField(
                      onTap: () => viewModel.tapped(),
                      icon: const Icon(Icons.password_rounded),
                      obscured: viewModel.isObscured,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      toggle: () {
                        viewModel.toggle();
                      },
                      controller: _passwordController,
                      label: 'Password',
                      focusNode: _passwordFocusNode,
                      validator: (password) =>
                          password == null || password.isEmpty
                              ? 'Please enter your password'
                              : null,
                    ),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      SecondaryButton(title: 'Sign Up', onPressed: () {}),
                      Visibility(
                        visible: viewModel.isLoading,
                        replacement: PrimaryButton(
                            title: 'Sign in',
                            onPressed: () async {
                              focusScope.unfocus();
                              if (_formLogin.currentState!.validate()) {
                                await viewModel.login(_usernameController.text,
                                    _passwordController.text);
                                if (viewModel.error == null) {
                                  scaffoldMessenger.showSnackBar(const SnackBar(
                                      content: Text('Login Success')));
                                  navigator.pushReplacementNamed(
                                      AppRoutes.homePage,
                                      arguments: () => navigator.pop());
                                } else if (viewModel.error != null) {
                                  scaffoldMessenger.showSnackBar(
                                      SnackBar(content: Text(viewModel.error)));
                                }
                              }
                            }),
                        child: const CircularProgressIndicator(),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
