import 'package:core/constants/app_constants.dart';
import 'package:core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomSheetData extends ConsumerWidget {
  const BottomSheetData(
      {Key? key,
      required this.row,
      required this.modalTitle,
      required this.tableTitle})
      : super(key: key);

  final List<Map<String, String>> row;
  final String modalTitle;
  final String tableTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    var column = [];
    for (var col in row) {
      final keys = col.keys.toList();
      column = keys;
    }
    return Wrap(
      children: [
        SizedBox(
          height: size.height * 0.60,
          width: size.width,
          child: ListView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.all(AppConstants.margin / 3),
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: PaginatedDataTable(
                    rowsPerPage: 4,
                    header: Text(tableTitle),
                    columns: List.generate(
                      column.length,
                      (index) => DataColumn(
                        label: Center(
                          child: Text(column[index]),
                        ),
                      ),
                    ),
                    source: _DataSource(context, row)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DataSource extends DataTableSource {
  _DataSource(this.context, this.data);

  final BuildContext context;
  final List<Map<String, String>> data;
  bool selected = false;
  int _selectedRowCount = 0;

  @override
  DataRow? getRow(int index) {
    if (index > data.length) {
      return DataRow(
          color: MaterialStateProperty.all(kPrimaryLight),
          cells: const [
            DataCell(Text('Kosong')),
          ]);
    }
    final row = data[index];
    final rowData = List.generate(row.keys.toList().length,
        (index) => row[row.keys.toList()[index]] ?? AppConstants.noData);
    return DataRow.byIndex(
      color: MaterialStateProperty.all(
          index % 2 == 0 ? kPrimaryLight : kSecondaryLight),
      index: index,
      cells: List.generate(rowData.length, (index) {
        return DataCell(Center(child: Text(rowData[index].toString())));
      }),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => _selectedRowCount;
}
