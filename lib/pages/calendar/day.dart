import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Day extends StatelessWidget {
  final DateTime date;
  ValueKey key;


  Day({this.date, this.key = const ValueKey("")});

  @override
  Widget build(BuildContext context) {
    return Card(
      key: key,
        child: Container(
      height: 100,
      child: Center(
        child: Text(DateFormat.yMMMd().format(date)),
      ),
    ));
  }
}
