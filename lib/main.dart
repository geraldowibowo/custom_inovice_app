import 'package:flutter/material.dart';
import 'calculator 2 disc/calculator.dart';
import 'calculator 3 disc/calculator.dart';
import 'calculator netto/calculator.dart';
import 'daftar_harga/daftar_harga.dart';
import 'penjumlahan/calculator.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:csv/csv.dart';

// import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // final List<Widget> pages = [
  //   Calculator(
  //     key: PageStorageKey('Page1'),
  //   ),
  //   Calculator2Disc(
  //     key: PageStorageKey('Page2'),
  //   ),
  // ];

  // final PageStorageBucket bucket = PageStorageBucket();

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 1;

  List<Widget> _widgetOptions = <Widget>[
    Calculator(),
    Calculator2Disc(),
    CalculatorNetto(),
    Penjumlahan(),
    DaftarHarga(),
  ];

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context);
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          // bucket: bucket,
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.looks_3
                  // color: Colors.black,
                  ),
              // ignore: deprecated_member_use
              title: Text(
                '3 Discount',
                // style: TextStyle(color: Colors.black),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calculate,
              ),
              // ignore: deprecated_member_use
              title: Text(
                '2 Discount',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.arrow_forward,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Netto Calc',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Jumlah',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Daftar',
              ),
            ),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          selectedFontSize: 11,
          unselectedFontSize: 10,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
        ),
      ),
    );
  }
}
