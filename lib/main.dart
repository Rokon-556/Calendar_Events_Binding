import 'package:calendar/calendar.dart';
import 'package:calendar/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TestPage().codeTest();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        //statusBarColor: Theme.of(context).colorScheme.background,
        //statusBarBrightness: Brightness.
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Task",
      home: CalendarPage(),
    );
  }
}
