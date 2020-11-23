import 'package:flutter/material.dart';


class AyarlarEkrani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Tamam'),
          onPressed: () {
            Navigator.pop(context);
            },
        ),
      ),
    );
  }
}