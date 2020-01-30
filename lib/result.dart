import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ocr/models/ktp.dart';
import 'package:ocr/upload.dart';

class Result extends StatefulWidget {
  Result({this.file});

  final File file;

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: FutureBuilder<String>(
          future: uploadImage(widget.file),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(child: Text("${snapshot.data}"));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
