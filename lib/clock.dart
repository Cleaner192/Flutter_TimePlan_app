import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  double percent = 0;
  static int TimeInMinut = 25;
  void add() {
    setState(() {
      TimeInMinut++;
    });
  }

  void substract() {
    setState(() {
      TimeInMinut--;
    });
  }

  int TimeInSec = TimeInMinut * 60;

  late Timer timer;
  _StopTimer() {
    percent = 0;
    timer.cancel();
  }

  _StartTimer() {
    {
      TimeInMinut = TimeInMinut;

      int Time = TimeInMinut * 60;
      double SecPercent = (Time / 100);
      timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        setState(() {
          if (Time > 0) {
            Time--;
            if (Time % 60 == 0) {
              TimeInMinut--;
            }
            if (Time % SecPercent == 0) {
              if (percent < 1) {
                percent += 0.01;
              } else {
                percent = 1;
              }
            }
          } else {
            percent = 0;
            TimeInMinut = TimeInMinut;
            timer.cancel();
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff1542bf), Color(0xff51a8ff)],
                  begin: FractionalOffset(0.5, 1))),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: CircularPercentIndicator(
                circularStrokeCap: CircularStrokeCap.round,
                percent: percent,
                animation: true,
                animateFromLastPercent: true,
                radius: 100.0,
                lineWidth: 20.0,
                progressColor: Colors.white,
                center: Text(
                  "$TimeInMinut",
                  style: TextStyle(color: Colors.white, fontSize: 80.0),
                ),
              )),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 130.0,
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        substract();
                      },
                      backgroundColor: Colors.white,
                      child: const Icon(Icons.remove, color: Colors.blue),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        add();
                      },
                      backgroundColor: Colors.white,
                      child: const Icon(Icons.add, color: Colors.blue),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0))),
                child: Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Column(
                            children: <Widget>[
                              Text(
                                "Study Timer",
                                style: TextStyle(
                                  fontSize: 30.0,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "$TimeInMinut",
                                style: TextStyle(fontSize: 60.0),
                              )
                            ],
                          )),
                        ],
                      )),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 30),
                            child: ElevatedButton(
                              onPressed: _StartTimer,
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ))),
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  "Start",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22.0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 30),
                            child: ElevatedButton(
                              onPressed: _StopTimer,
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ))),
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  "Stop",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
