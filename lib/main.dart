import 'package:flutter/material.dart';
import 'dart:async';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'clock.dart';
import 'event_calendar.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('TimePlan'),
            centerTitle: true,
            bottom: TabBar(tabs: [
              Tab(
                text: 'Calendar',
                icon: Icon(Icons.calendar_month),
              ),
              Tab(
                text: 'Timer',
                icon: Icon(Icons.lock_clock),
              ),
            ]),
          ),
          body: TabBarView(children: [
            EventCalendarScreen(),
            ClockPage(),
          ]),
        ),
      );
}
