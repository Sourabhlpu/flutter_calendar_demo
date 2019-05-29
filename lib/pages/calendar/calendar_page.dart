import 'package:flutter/material.dart';

import 'day.dart';
import 'days_manager.dart';

class CalendarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarPageState();
  }
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime focusedDate = DateTime.now();
  final int daysBeforeFocusDate = 30;
  final int totalDaysToInit = 61;
  List<Day> days;

  final Widget _accountIcon = IconButton(
    icon: Icon(Icons.account_circle),
    onPressed: () {},
  );

  Future _selectDate() async {
    DateTime selected = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2010),
        lastDate: new DateTime.now().add(Duration(days: 365*5))
    );
    if(selected != null)
      setState(() =>
      focusedDate = selected
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: _accountIcon,
          title: Text('Calendar'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.date_range),
              onPressed: _selectDate,
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
        body: DaysManager(
          focusDate: focusedDate,
        ));
  }
  _getDaysList(DateTime focusDate)
  {
    final DateTime startDate =
    focusDate.subtract(Duration(days: daysBeforeFocusDate));
    days = List.generate(totalDaysToInit, (int index) {
      return Day(
        date: startDate.add(
          Duration(days: index),
        ),
      );
    });
  }
}
