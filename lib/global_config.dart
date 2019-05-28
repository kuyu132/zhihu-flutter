import 'package:flutter/material.dart';

class GlobalConfig {
  static ThemeData themeData = new ThemeData.dark();
  static bool dark = true;
  static Color fontColor = Colors.white30;
  //news_content+id
  static String news_content = "https://news-at.zhihu.com/api/4/news/";
}

enum SearchType { HOT, DIGITAL, MOVIE,SPORTS, NEW_KNOWLEDGE, VARIETY }
