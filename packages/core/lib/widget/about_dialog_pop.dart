import 'package:core/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutDialogPop extends StatefulWidget {
  const AboutDialogPop(
      {Key? key,
      required this.title,
      required this.data,
      required this.actions,
      required this.onTap})
      : super(key: key);

  final String title;
  final List<Map<String, dynamic>> data;
  final List<Widget> actions;
  final Function(int? index) onTap;

  @override
  State<AboutDialogPop> createState() => _AboutDialogPopState();
}

class _AboutDialogPopState extends State<AboutDialogPop> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final navigator = Navigator.of(context);
    final size = MediaQuery.of(context).size;
    return CupertinoAlertDialog(
      title: Padding(
        padding: const EdgeInsets.only(bottom: AppConstants.margin / 3),
        child: Text(
          widget.title,
        ),
      ),
      content: SizedBox(
        height: size.height * 0.20,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          slivers: [
            SliverVisibility(
              visible: widget.data.isNotEmpty,
              replacementSliver: const SliverFillRemaining(
                  child: Center(
                child: Text('No Data'),
              )),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppConstants.margin / 3),
                      child: Material(
                          borderOnForeground: false,
                          type: MaterialType.transparency,
                          child: Theme(
                              data: ThemeData(
                                splashFactory: NoSplash.splashFactory,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                primaryColor: CupertinoColors.systemBlue,
                                dividerColor: Colors.transparent,
                              ),
                              child: ExpansionTile(
                                title: Text(widget.data[index]['hauler_name']),
                                leading: GestureDetector(
                                    onTap: () {
                                      setState(() {});
                                      widget.onTap(index);
                                    },
                                    child: const Icon(
                                        CupertinoIcons.delete_simple)),
                                children: [
                                  ListTile(
                                    title: const Text(
                                      'Rit :',
                                    ),
                                    trailing: Text(
                                      widget.data[index]['rit'],
                                    ),
                                  ),
                                  ListTile(
                                    title: const Text(
                                      'Produksi (BCM) :',
                                    ),
                                    trailing: Text(
                                      widget.data[index]['produksi'],
                                    ),
                                  ),
                                ],
                              ))),
                    ),
                  ],
                );
              }, childCount: widget.data.length)),
            ),
          ],
        ),
      ),
      actions: widget.actions,
    );
  }
}
