import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_zhihu/network/model/follow_item_response.dart';
import 'apis.dart';
import 'package:flutter_zhihu/network/model/news_detail_response.dart';
import 'package:flutter_zhihu/network/model/short_comments_response.dart';

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

  Future<FollowItemResponse> getLatestNews() async {
    Response response = await dio.get(Apis.LATEST_NEWS);
    FollowItemResponse itemResponse =
        FollowItemResponse.fromJson(response.data);
    return itemResponse;
  }

  Future<NewsDetailResponse> getNewsDetail(int id) async {
    Response response = await dio.get(Apis.NEWS_CONTENT + id.toString());
    NewsDetailResponse newsDetailResponse =
        NewsDetailResponse.fromJson(response.data);
    return newsDetailResponse;
  }

  Future<ShortCommentsResponse> getShortComments(int id) async {
    Response response = await dio.get(Apis.SHORT_COMMENTS_PREFIX +
        id.toString() +
        Apis.SHORT_COMMENTS_SUFFIX);
    return ShortCommentsResponse.fromJson(response.data);
  }
}
