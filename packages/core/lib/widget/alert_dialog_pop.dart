import 'package:core/constants/colors.dart';
import 'package:core/widget/custom_text_form_field.dart';
import 'package:core/widget/secondary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlertDialogPop extends ConsumerWidget {
  const AlertDialogPop({Key? key, required this.title, this.content})
      : super(key: key);

  final String title;
  final String? content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoAlertDialog(
        title: Text(title),
        content: Text(content ?? ""),
        actions: [
          CupertinoDialogAction(
            child: const Text("Cancel"),
            isDefaultAction: true,
            onPressed: () => Navigator.of(context).pop(false),
          ),
          CupertinoDialogAction(
            child: const Text("OK"),
            onPressed: () => Navigator.of(context).pop(true),
          )
        ]);
  }
}
