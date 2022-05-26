import 'package:core/model/login_model.dart';
import 'package:core/providers.dart';
import 'package:core/utils/secure_storage.dart';
import 'package:core/widget/alert_dialog_pop.dart';
import 'package:core/widget/custom_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsp_app1/view/home/back_child.dart';
import 'package:gsp_app1/view/home/front_child.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final StorageHelper _helper = StorageHelper();
  LoginModel? data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    data = await _helper.getDataUser().whenComplete(() {
      setState(() {});
    });
    final backViewModel = ref.read(backProvider.notifier);
    backViewModel.setSite(data!.data!.user!.companySite![0]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return await showCupertinoDialog(
              context: context,
              builder: (context) => const AlertDialogPop(
                    title: 'Are you sure you want to quit?',
                    content: 'You will lose any unsaved data.',
                  ));
        },
        child: CustomDrawer(
            backChild: HomeBackChild(
              data: data,
            ),
            frontChild: (toggleDrawer) => HomeFrontChild(
                  toggleDrawer: toggleDrawer,
                )),
      ),
    );
  }
}
