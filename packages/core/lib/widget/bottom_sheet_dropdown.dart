import 'package:core/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomSheetDropdown extends ConsumerStatefulWidget {
  const BottomSheetDropdown(
      {Key? key,
      required this.modalTitle,
      required this.data,
      required this.controller,
      required this.navigator})
      : super(key: key);

  final String modalTitle;
  final List<DropdownDataModel> data;
  final TextEditingController controller;
  final NavigatorState navigator;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BottomSheetDropdownState();
}

class _BottomSheetDropdownState extends ConsumerState<BottomSheetDropdown> {
  List<DropdownDataModel> filtered = [];

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(formCoalProvider);
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Wrap(
      children: [
        ListTile(
          tileColor: theme.colorScheme.secondary,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
          title: Text(widget.modalTitle),
          trailing: SizedBox(
              width: 150,
              child: TextField(
                controller: widget.controller,
                onChanged: (value) {
                  filtered = widget.data
                      .where((element) => element.label!
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                  setState(() {});
                },
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    floatingLabelStyle:
                        TextStyle(color: theme.colorScheme.onPrimary),
                    border: InputBorder.none,
                    labelText: 'Tap here to search'),
              )),
        ),
        Container(
          height: size.height * 0.40,
          width: size.width,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0))),
          child: filtered.isEmpty
              ? ListView.builder(
                  itemCount: widget.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: index % 2 == 0
                          ? theme.colorScheme.secondaryContainer
                          : theme.colorScheme.primaryContainer,
                      child: ListTile(
                        selected: false,
                        onTap: () => widget.navigator.pop(widget.data[index]),
                        title: Text(widget.data[index].label!),
                      ),
                    );
                  })
              : ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: index % 2 == 0
                          ? theme.colorScheme.secondaryContainer
                          : theme.colorScheme.primaryContainer,
                      child: ListTile(
                        selected: false,
                        onTap: () => widget.navigator.pop(filtered[index]),
                        title: Text(filtered[index].label!),
                      ),
                    );
                  }),
        ),
      ],
    );
  }
}

class DropdownDataModel {
  DropdownDataModel({
    this.label,
    this.value,
  });

  String? label;
  int? value;
}
