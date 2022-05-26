import 'package:core/constants/app_constants.dart';
import 'package:core/constants/colors.dart';
import 'package:core/model/history/coal/coal_model.dart';
import 'package:core/widget/bottom_sheet_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoalDataTable extends StatelessWidget {
  const CoalDataTable({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<CoalModel> data;

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      'Details',
      'Loader',
      'Material Code',
      'Last Activity',
      'Shift',
      'Site',
      'Distance',
      'RIT',
      'Production (Ton)'
    ];
    return ListView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(AppConstants.margin / 2),
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
              rowsPerPage: 7,
              header: const Text('Produksi Batubara Stockpile'),
              columns: List.generate(
                title.length,
                (index) => DataColumn(
                  label: Center(
                    child: Text(title[index]),
                  ),
                ),
              ),
              source: _DataSource(context, data)),
        ),
      ],
    );
  }
}

class _DataSource extends DataTableSource {
  _DataSource(this.context, this.data);

  final BuildContext context;
  final List<CoalModel> data;
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
    final rowData = [
      'Details',
      row.unitLoaderName ?? AppConstants.noData,
      row.materialType ?? AppConstants.noData,
      row.lastProd != null
          ? DateFormat(TimeConstants.dateFormat)
              .format(DateTime.parse(row.lastProd.toString()))
          : AppConstants.noData,
      row.shift ?? AppConstants.noData,
      row.id ?? AppConstants.noData,
      row.distance ?? AppConstants.noData,
      row.totalRit ?? AppConstants.noData,
      row.totalBCM ?? AppConstants.noData,
    ];
    return DataRow.byIndex(
      color: MaterialStateProperty.all(
          index % 2 == 0 ? kPrimaryLight : kSecondaryLight),
      index: index,
      onLongPress: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(row.totalBCM.toString()),
        ));
      },
      cells: List.generate(rowData.length, (index) {
        if (index == 0) {
          return DataCell(
            const Center(
                child: Icon(
              Icons.arrow_drop_down_circle_outlined,
            )),
            onTap: () {
              if (row.hauler != null) {
                final haulerData = row.hauler!.split("|||");
                List<Map<String, String>> temps = [];
                for (var hauler in haulerData) {
                  var temp = hauler.split("||");
                  temps.add({
                    'Hauler Name': temp[0],
                    'RIT': temp[1],
                    'BCM': temp[2],
                    'Date': temp[3],
                    'PPD ID': temp[4],
                  });
                }
                showModalBottomSheet(
                    elevation: 0.0,
                    context: context,
                    builder: (_) => BottomSheetData(
                          row: temps,
                          modalTitle: 'Details',
                          tableTitle: 'Hauler',
                        ));
              }
            },
          );
        }
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
