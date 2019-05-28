import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_zhihu/network/model/follow_item_response.dart';

class HttpManager {
  String base_url = "http://192.168.72.225:8989";
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

  Future<FollowItemResponse> getQuestions() async {
    print(base_url + "/questions");
    Response response = await dio.get(base_url + "/questions");
    print(response.data.toString());
    FollowItemResponse itemResponse = FollowItemResponse.fromJson(response.data);
    return itemResponse;
  }
}
