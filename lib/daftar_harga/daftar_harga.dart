import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

class DaftarHarga extends StatefulWidget {
  @override
  _DaftarHargaState createState() => _DaftarHargaState();
}

class _DaftarHargaState extends State<DaftarHarga> {
  List<List<dynamic>> data = [];

  loadAsset() async {
    final mydata = await rootBundle.loadString('assets/harga_juli.csv');
    List<List<dynamic>> csvTable = CsvToListConverter().convert(mydata);
    setState(() {
      data = csvTable;
    });
  }

  @override
  void initState() {
    loadAsset();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var tableContents = [];

    for (int i = 1; i < 1000; i++) {
      tableContents.add(
        DataRow(
            cells: (data[i])
                .map((info) => DataCell(Text(info.toString())))
                .toList()),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(data[index][2]),
                    width: mediaQuery.size.width * 0.4,
                    // clipBehavior: Clip.antiAlias,
                  ),
                  Container(child: Text(data[index][3].toString())),
                  Text(data[index][4].toString()),
                  Text(data[index][5].toString()),
                ]);
          },

          //     DataTable(columnSpacing: 7, columns: [
          //   DataColumn(label: Text('No')),
          //   DataColumn(label: Text('Merk')),
          //   DataColumn(label: Text('Nama')),
          //   DataColumn(label: Text('Isi/ktk')),
          //   DataColumn(label: Text('Isi/dus')),
          //   DataColumn(label: Text('Harga')),
          // ], rows: [
          //   // DataRow(cells: [
          //   //   DataCell(Text('1')),
          //   //   DataCell(Text('Onda')),
          //   //   DataCell(Text('A801')),
          //   //   DataCell(Text('12')),
          //   //   DataCell(Text('120')),
          //   //   DataCell(Text('15000')),
          //   // ]),
          //   ...tableContents,
          //   // DataRow(
          //   //     cells: (data[1].toList())
          //   //         .map((info) => DataCell(Text(info.toString())))
          //   //         .toList()),
          // ]),
          // itemCount: 1000,
        ),
      ),
    );
  }
}
