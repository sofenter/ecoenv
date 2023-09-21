import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:po_app/constants/color_constants.dart';
import 'package:po_app/constants/footer_file.dart';

class SmallDisposalsHistoryPage extends StatefulWidget {
  const SmallDisposalsHistoryPage({super.key});

  @override
  State<SmallDisposalsHistoryPage> createState() =>
      _SmallDisposalsHistoryPageState();
}

class _SmallDisposalsHistoryPageState extends State<SmallDisposalsHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        title: Text(
          'Disposals History',
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            DataTable(
              columnSpacing: 20,
              columns: [
                DataColumn(label: Text('Device')),
                DataColumn(label: Text('Type')),
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Credit')),
              ],
              rows: [
                DataRow(
                  //   color: MaterialStateProperty.resolveWith<Color?>(
                  //     (Set<MaterialState> states) {
                  //   // All rows will have the same selected color.
                  //   if (states.contains(MaterialState.selected)) {
                  //     return Theme.of(context).colorScheme.primary.withOpacity(0.08);
                  //   }
                  //   // Even rows will have a grey color.
                  //   if (index.isEven) {
                  //     return Colors.grey.withOpacity(0.3);
                  //   }
                  //   return null; // Use default value for other states and odd rows.
                  // }),
                  cells: [
                    DataCell(
                      Text("Samsung Galaxy"),
                    ),
                    DataCell(
                      Text("Phone"),
                    ),
                    DataCell(
                      Text("12.09.2023"),
                    ),
                    DataCell(
                      Text("1000"),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text("Samsung Galaxy"),
                    ),
                    DataCell(
                      Text("Phone"),
                    ),
                    DataCell(
                      Text("12.09.2023"),
                    ),
                    DataCell(
                      Text("1000"),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            
            FooterConstants(),
          ],
        ),
      ),
    );
  }
}
