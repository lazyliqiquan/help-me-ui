import 'package:help_me_ui/utils/network.dart' as network;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

//从后端下载指定路径的文件，图片或文本文件
Future<dynamic> downloadFile(String filePath, {bool plainText = false}) async {
  FormData formData = FormData.fromMap({
    'file': filePath,
  });
  return await network.dio
      .post('/downloadFile',
          data: formData,
          options: Options(
              responseType:
                  plainText ? ResponseType.plain : ResponseType.bytes))
      .then((value) {
    return value.data;
  }).onError((error, stackTrace) {
    debugPrint(error.toString());
    return null;
  });
}
