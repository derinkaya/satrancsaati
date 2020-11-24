import 'package:flutter/material.dart';
import 'dart:async';

int SIYAH = 1;
int BEYAZ = 2;

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//        theme: ThemeData.light().copyWith(
//          platform: _platform ?? Theme.of(context).platform,
//        ),
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
                body: GestureDetector(
                    onTap: () => {
                          print("Tapped!"),
                        },
                    onTapDown: (TapDownDetails details) => _onTapDown(details),
                    onTapUp: (TapUpDetails details) => _onTapUp(details),
                    child: SafeArea(
                        child: Column(children: <Widget>[
                      Container(
                        color: Colors.black,
                        height: MediaQuery.of(context).size.height / 2,
                        child: Center(
                          child: Column(children: <Widget>[
                            SizedBox(height: 20),
                            Text('SİYAH',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 40),
                            Text('$_counter_black',
                                style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                          ]),
                        ),
//                        child: Chewie(
//                          controller: _chewieController,
//                        ),
                      ),
                      PreferredSize(
                          preferredSize: Size.fromHeight(50.0),
                          child: Expanded(
                            child: Container(
                              color: Colors.white,
                              child: Center(
                                child: Column(children: <Widget>[
                                  SizedBox(height: 20),
                                  Text('BEYAZ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  SizedBox(height: 40),
                                  Text('$_counter_white',
                                      style: TextStyle(
                                          fontSize: 36,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black))
                                ]),
                              ),
                            ),
                          ))
                    ]))))));
  }

  _onTapDown(TapDownDetails details) {
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;
    // or user the local position method to get the offset
    print(details.localPosition);
    print("tap down " + x.toString() + ", " + y.toString());
  }

  _onTapUp(TapUpDetails details) {
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;
    // or user the local position method to get the offset
    print(details.localPosition);
    print("tap up " + x.toString() + ", " + y.toString());
    if (y < 420) {
      if (sira == SIYAH) {
        sira = BEYAZ;
        _startTimerWhite();
      }
    } else {
      if (sira == BEYAZ) {
        sira = SIYAH;
        _startTimerBlack();
      }
    }
  }

  int sira = SIYAH; // ilk hamleyi siyah yapmalı.
  Timer _timer_white;
  Timer _timer_black;
  int _counter_white = 600;
  int _counter_black = 600;

  _startTimerBlack() {
//    const oneSec = const Duration(seconds: 1);
    const yuzMs = const Duration(milliseconds: 100);
    _timer_black = new Timer.periodic(
      yuzMs,
      (Timer timer) => setState(
        () {
          if (sira == BEYAZ) {
            timer.cancel();
          }
          if (_counter_black < 1) {
            timer.cancel(); // loss black
          } else {
            _counter_black = _counter_black - 1;
          }
        },
      ),
    );
  }

  _startTimerWhite() {
//    const oneSec = const Duration(seconds: 1);
    const yuzMs = const Duration(milliseconds: 100);
    _timer_white = new Timer.periodic(
      yuzMs,
      (Timer timer) => setState(
        () {
          if (sira == SIYAH) {
            timer.cancel();
          }
          if (_counter_white < 1) {
            timer.cancel(); // loss white
          } else {
            _counter_white = _counter_white - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer_white.cancel();
    _timer_black.cancel();
    super.dispose();
  }

}
