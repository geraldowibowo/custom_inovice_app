import 'package:flutter/material.dart';
import 'subtotal_input.dart';
import 'store_and_calculate.dart';
import 'package:bon_calculator/main.dart';
import 'number_input.dart';

// ignore: must_be_immutable
class Penjumlahan extends StatefulWidget {
  @override
  _PenjumlahanState createState() => _PenjumlahanState();
}

class _PenjumlahanState extends State<Penjumlahan> {
  double grandTotal = 0;

  // void _qtyInput(qtyVal, int rowNumber) {
  //   setState(() {
  //     if (qtyVal.text == "") {
  //       subTotal[rowNumber] = 0;
  //     } else {
  //       quantity[rowNumber] = double.parse(qtyVal.text);
  //       updateSubtotal();
  //     }
  //   });
  // }

  void _hargaInput(hargaVal, int rowNumber) {
    setState(() {
      if (hargaVal.text == "") {
        subTotal[rowNumber] = 0;
      } else {
        hargaBarang[rowNumber] = double.parse(hargaVal.text);
        updateSubtotal();
      }
    });
  }

  void updateSubtotal() {
    setState(() {
      for (int i = 0; i < maxRows; i++) {
        subTotal[i] = hargaBarang[i];
      }

      grandTotal = 0;
      for (int i = 0; i < maxRows; i++) {
        grandTotal += subTotal[i];
      }
    });
  }

  void _resetButton() {
    setState(() {
      for (int i = 0; i < maxRows; i++) {
        hargaBarang[i] = 0;
        subTotal[i] = 0;
      }
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (_, __, ___) => MyApp(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    var tableHeader = [
      TableRow(children: [
        Text(
          'No.',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        Text(
          'Yang Dijumlahkan',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        Text(
          'Subtotal',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ]),
    ];

    var tableContents = [];

    for (int i = 0; i < maxRows; i++) {
      tableContents.add(TableRow(children: [
        SubtotalInput(i + 1),
        NumberInput(addNumber: _hargaInput, rowNumber: i),
        SubtotalInput(subTotal[i]),
      ]));
    }

    // var tableContents = [
    //   TableRow(children: [
    //     NumberInput(addNumber: _qtyInput, rowNumber: 0),
    //     NumberInput(addNumber: _hargaInput, rowNumber: 0),
    //     NumberInput(addNumber: _disc1, rowNumber: 0, maxLength: 4),
    //     NumberInput(addNumber: _disc2, rowNumber: 0, maxLength: 4),
    //     NumberInput(addNumber: _disc3, rowNumber: 0, maxLength: 4),
    //     SubtotalInput(subTotal[0]),
    //   ]),
    //   TableRow(children: [
    //     NumberInput(addNumber: _qtyInput, rowNumber: 1),
    //     NumberInput(addNumber: _hargaInput, rowNumber: 1),
    //     NumberInput(addNumber: _disc1, rowNumber: 1, maxLength: 4),
    //     NumberInput(addNumber: _disc2, rowNumber: 1, maxLength: 4),
    //     NumberInput(addNumber: _disc3, rowNumber: 1, maxLength: 4),
    //     SubtotalInput(subTotal[1]),
    //   ]),
    // ];

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: _resetButton,
                child: Text('AC'),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Table(
                    columnWidths: {
                      0: FlexColumnWidth(0.2),
                    },
                    border: TableBorder.all(),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [...tableHeader, ...tableContents],
                  ),
                ),
              ],
            ),
          ),
          GrandTotal(grandTotal, mediaQuery),
        ],
      ),
    );
  }
}
