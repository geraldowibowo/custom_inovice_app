import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class SubtotalInput extends StatelessWidget {
  final subTotal;

  SubtotalInput(this.subTotal);
  var formatter = NumberFormat('###,###.#');
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(2),
      alignment: Alignment.center,
      height: 25,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Text(
          formatter.format(subTotal),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class GrandTotal extends StatelessWidget {
  final grandTotal;
  final mediaQuery;

  GrandTotal(this.grandTotal, this.mediaQuery);
  var formatter = NumberFormat('###,###.#');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text(
          'Grand Total: ',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Container(
          height: 20,
          width: mediaQuery.size.width * 0.3,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              formatter.format(grandTotal),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ]),
    );
  }
}
