import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormCoalConfirm extends StatelessWidget {
  const FormCoalConfirm(
      {Key? key,
      required this.title,
      required this.data,
      required this.isList,
      required this.navigator,
      required this.confirm})
      : super(key: key);

  final String title;
  final Map<String, dynamic> data;
  final int isList;
  final NavigatorState navigator;
  final VoidCallback? confirm;

  @override
  Widget build(BuildContext context) {
    final keys = data.keys.toList();
    final value = data.values.toList();
    return CupertinoActionSheet(
      title: Text(title),
      message: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 50,
              width: 100,
              child: CupertinoDialogAction(
                  onPressed: () => navigator.pop(false),
                  child: Text('Cancel'))),
          SizedBox(
              height: 50,
              width: 100,
              child: CupertinoDialogAction(
                  onPressed: () => navigator.pop(true),
                  isDefaultAction: true,
                  child: Text('Confirm'))),
        ],
      ),
      actions: List.generate(
        data.length,
        (index) {
          return CupertinoActionSheetAction(
            onPressed: () {},
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
                child: index == isList
                    ? ExpansionTile(
                        title: Text(keys[index]),
                        children: List.generate(value[isList][0].keys.length,
                            (index) {
                          List<String> keys = [];
                          List<dynamic> values = [];
                          List<dynamic> combinedValues = [];
                          for (var i in value[isList]) {
                            keys = i.keys.toList();
                            values.add(i.values.toList());
                          }
                          for (var z in values) {
                            combinedValues.add(z[index]);
                          }
                          return ListTile(
                            title: Text(keys[index]),
                            trailing: Text(
                              combinedValues.join(', '),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }))
                    : ListTile(
                        title: Text(keys[index]),
                        trailing: Text(value[index].toString()),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
