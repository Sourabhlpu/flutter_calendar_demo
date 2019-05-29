import 'package:flutter/material.dart';

import 'day.dart';

class DaysManager extends StatelessWidget {
  final int daysBeforeFocusDate = 30;
  final int totalDaysToInit = 61;
  static final double ITEM_HEIGHT = 108.00;

  ScrollController scrollController;

  List<Day> days;

  DaysManager({DateTime focusDate}) {
    final DateTime startDate =
        focusDate.subtract(Duration(days: daysBeforeFocusDate));
    days = List.generate(totalDaysToInit, (int index) {
      return Day(
        date: startDate.add(
          Duration(days: index),
        ),
      );
    });

    scrollController = ScrollController(initialScrollOffset: 30 * ITEM_HEIGHT);
  }

  @override
  Widget build(BuildContext context) {
    return _buildScrollView();
  }

  ListView _buildScrollView() {
    ListView listView = ListView.builder(
        cacheExtent: 0,
        controller: ScrollController(initialScrollOffset: 30 * ITEM_HEIGHT),
        itemCount: days.length,
        itemBuilder: (BuildContext context, int index) {
          return days[index];
        });

    return listView;
  }
}
