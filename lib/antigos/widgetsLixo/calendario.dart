import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final EasyInfiniteDateTimelineController controller =
        EasyInfiniteDateTimelineController();

    return Scaffold(
      body: Center(
          child: EasyDateTimeLine(
        locale: "pt-br",
        initialDate: DateTime.now(),
        onDateChange: (selectedDate) {
          //`selectedDate` the new date selected.
        },
        activeColor: const Color(0xff55BB8B),
        headerProps: const EasyHeaderProps(showHeader: false),
        dayProps: const EasyDayProps(
          height: 56.0,
          width: 56.0,
          dayStructure: DayStructure.dayNumDayStr,
          inactiveDayStyle: DayStyle(
            borderRadius: 48.0,
            dayNumStyle: TextStyle(
              fontSize: 18.0,
            ),
          ),
          activeDayStyle: DayStyle(
            dayNumStyle: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )),
    );
  }
}
