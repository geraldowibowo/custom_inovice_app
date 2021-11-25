import 'package:flutter/material.dart';
import 'subtotal_input.dart';
import 'store_and_calculate.dart';
import 'package:bon_calculator/main.dart';
import 'number_input.dart';

// ignore: must_be_immutable
class Calculator2Disc extends StatefulWidget {
  // final Key? key;

  // Calculator2Disc({this.key});

  @override
  _Calculator2DiscState createState() => _Calculator2DiscState();
}

class _Calculator2DiscState extends State<Calculator2Disc> {
  double grandTotal = 0;

  void _qtyInput(qtyVal, int rowNumber) {
    setState(() {
      if (qtyVal.text == "") {
        subTotal[rowNumber] = 0;
      } else {
        quantity[rowNumber] = double.parse(qtyVal.text);
        updateSubtotal();
      }
    });
  }

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

  void _disc1(d1Val, int rowNumber) {
    setState(() {
      if (d1Val.text == "") {
        d1[rowNumber] = 0;
        updateSubtotal();
      } else {
        d1[rowNumber] = double.parse(d1Val.text);
        updateSubtotal();
      }
    });
  }

  void _disc2(d2Val, int rowNumber) {
    setState(() {
      if (d2Val.text == "") {
        d2[rowNumber] = 0;
        updateSubtotal();
      } else {
        d2[rowNumber] = double.parse(d2Val.text);
        updateSubtotal();
      }
    });
  }

  void updateSubtotal() {
    setState(() {
      for (int i = 0; i < maxRows; i++) {
        subTotal[i] = quantity[i] *
            hargaBarang[i] *
            (100 - d1[i]) /
            100 *
            (100 - d2[i]) /
            100;
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
        quantity[i] = 0;
        hargaBarang[i] = 0;
        d1[i] = 0;
        d2[i] = 0;
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
          'Qty',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        Text(
          'Harga',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        Text(
          'D1',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        Text(
          'D2',
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
        NumberInput(addNumber: _qtyInput, rowNumber: i, maxLength: 6),
        NumberInput(addNumber: _hargaInput, rowNumber: i),
        NumberInput(
            addNumber: _disc1, rowNumber: i, maxLength: 4, fontSize: 14),
        NumberInput(
            addNumber: _disc2, rowNumber: i, maxLength: 4, fontSize: 14),
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
                    border: TableBorder.all(),
                    columnWidths: {
                      0: FlexColumnWidth(0.5),
                      2: FlexColumnWidth(0.3),
                      3: FlexColumnWidth(0.3),
                    },
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
