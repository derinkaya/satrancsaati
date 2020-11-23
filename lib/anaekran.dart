import 'package:flutter/material.dart';

class AnaEkran extends StatelessWidget {
/*
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Satranç Saati"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            },
          child: Text('Ok'),
        ),
      ),
    );
  }
*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//        theme: ThemeData.light().copyWith(
//          platform: _platform ?? Theme.of(context).platform,
//        ),
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                  title: Text('Satranç saati'),
                ),
                body: SafeArea(
                    child: Column(children: <Widget>[
                      Container(
                        color: Colors.greenAccent,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 2.2, // Also Including Tab-bar height.
//                        child: Chewie(
//                          controller: _chewieController,
//                        ),
                      ),
                      PreferredSize(
                        preferredSize: Size.fromHeight(50.0),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.red,
                          child: Center(child: Text('Tab2')),
                        ),
                      ),
                    ]
                    )

                )
            )
        )
    );
  }
}
