import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ocr/models/ktp.dart';
import 'package:ocr/constants.dart';

Future<String> uploadImage(File file) async {
  String url = "$BACKEND_API/";

  String fileName = file.path.split('/').last;
  FormData formData = FormData.fromMap({
    "file": await MultipartFile.fromFile(file.path, filename: fileName),
  });

  Dio dio = new Dio();
  final response = await dio.post(url, data: formData);

  // return KTP.serialize(json.decode(response.data.toString()));

  print(response.data.toString());

  return response.data.toString();
}
