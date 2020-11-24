import 'package:flutter/material.dart';

class AnaEkran extends StatelessWidget {
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
                    height: MediaQuery.of(context).size.height /
                        2,
                    child: Center(
                      child: Column(children: <Widget>[
                        SizedBox(height: 20),
                        Text('SİYAH',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        SizedBox(height: 40),
                        Text('01:00',
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
                              Text('01:00',
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
  }
}
