import 'package:dio/dio.dart';
import 'dart:async';

class HttpManager {
  Dio dio = new Dio();

/*
读取json文件
 */
  Future readJsonFile(Dio dio, String url) async {
    try {
      Response response =
      await dio.get(url, options: Options(responseType: ResponseType.JSON));
    } catch (e) {}
  }
}

