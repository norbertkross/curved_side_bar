// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:curved_side_bar/shape/Curve_bar.dart';
import 'package:flutter/material.dart';
import 'package:swipe/swipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    // ignore:
    return Scaffold(
      body: CurvedBar(),
    );
  }
}

class CurvedBar extends StatefulWidget {
  final int numberOfItems;
  final double itemsPadding;
  final double spacing;
  final WrapAlignment? alignment;
  final Widget? body;
  final Duration? duration;
  final double width;

  const CurvedBar({
    this.numberOfItems = 5,
    this.spacing = 5.0,
    this.itemsPadding = 20.0,
    Key? key,
    this.alignment,
    this.body,
    this.duration,
    this.width = 120.0,
  }) : super(key: key);

  @override
  _CurvedBarState createState() => _CurvedBarState();
}

class _CurvedBarState extends State<CurvedBar> {
  bool show = false;
  bool arrowIn = false;

  swipeSides() {
    setState(() {
      show = !show;
      arrowIn = !arrowIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return Material(
      elevation: 30.0,
      type: MaterialType.transparency,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: widget.duration ?? Duration(milliseconds: 500),
            top: 0,
            bottom: 0,
            left: show == false ? -100 : -4,
            child: Swipe(
              onSwipeLeft: () {
                swipeSides();
              },
              onSwipeRight: () {
                swipeSides();
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(
                          widget.width, MediaQuery.of(context).size.height),
                      //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: RPSCustomPainter(
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: widget.itemsPadding / 2),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(top: (mq.height * 0.1138) / 2),
                            child: Container(
                              height: mq.height - (mq.height * 0.1138),
                              child: Wrap(
                                direction: Axis.vertical,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      /// MAIN BODY WHERE ITEMS ARE PLACED
                                      Container(
                                        height:
                                            mq.height - (mq.height * 0.1138),
                                        width: (widget.width -
                                                widget.itemsPadding) -
                                            ((24.0 / 100.0) * widget.width),
                                        child: Wrap(
                                          alignment: WrapAlignment.spaceAround,
                                          direction: Axis.vertical,
                                          children: [
                                            for (int t = 0;
                                                t <= (widget.numberOfItems) - 1;
                                                t++)
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: widget.spacing),
                                                child: Container(
                                                  height: (widget.width -
                                                          widget.itemsPadding) -
                                                      ((24.0 / 100.0) *
                                                          widget.width),
                                                  width: (widget.width -
                                                          widget.itemsPadding) -
                                                      ((24.0 / 100.0) *
                                                          widget.width),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    color: Colors.red
                                                        .withOpacity(.35),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),

                                      /// SPACE BETWEEN MAIN WIDGET AND BULGE
                                      Container(
                                        child: SizedBox(
                                          width: widget.itemsPadding / 2.0,
                                          height: 400,
                                        ),
                                      ),

                                      /// THE CURVED BULGING OUT OF WIDGET
                                      Container(
                                        height:
                                            mq.height - (mq.height * 0.1138),
                                        width: ((24.0 / 100.0) * widget.width),
                                        child: Wrap(
                                          alignment: widget.alignment ??
                                              WrapAlignment.spaceEvenly,
                                          direction: Axis.vertical,
                                          children: [
                                            SizedBox(
                                              width: 1.0,
                                              height: 1.0,
                                            ),

                                            /// Arrow
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 6.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    show = !show;
                                                    arrowIn = !arrowIn;
                                                  });
                                                },
                                                child: Container(
                                                  width: ((24.0 / 100.0) *
                                                      widget.width),
                                                  height: (mq.height) * .12095,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(.001),
                                                    borderRadius:
                                                        BorderRadius.horizontal(
                                                            right:
                                                                Radius.circular(
                                                                    80.0)),
                                                  ),
                                                  child: arrowIn == false
                                                      ? Icon(
                                                          Icons.chevron_right,
                                                          size: 30.0,
                                                        )
                                                      : Icon(
                                                          Icons.chevron_left,
                                                          size: 30.0,
                                                        ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 1.0,
                                              height: 1.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          widget.body ?? Container(),
        ],
      ),
    );
  }
}
