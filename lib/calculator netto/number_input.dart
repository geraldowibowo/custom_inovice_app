import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: unused_import
import 'package:intl/intl.dart';

class NumberInput extends StatefulWidget {
  final Function addNumber;
  final int rowNumber;
  final int? maxLength;
  final double? fontSize;
  // final Function? cleanNumber;

  NumberInput({
    required this.addNumber,
    required this.rowNumber,
    this.maxLength = 10,
    this.fontSize = 15,
    // this.cleanNumber,
  });

  @override
  _NumberInputState createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  var val = TextEditingController();

  void _submitData() {
    widget.addNumber(val, widget.rowNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      height: 25,
      child: TextField(
          maxLines: 1,
          style: TextStyle(fontSize: widget.fontSize),
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            counterText: "",
            // contentPadding: EdgeInsets.only(bottom: 14),
          ),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r"^\d+\.?\d{0,2}")),
          ],
          controller: val,
          textInputAction: TextInputAction.next,
          onChanged: (_) {
            _submitData();
            // _clearData();
          }),
    );
  }
}
