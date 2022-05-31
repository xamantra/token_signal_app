import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:token_signal_app/src/news.data.dart';
import 'package:http/http.dart' as http;

Future<List<NewsData>> getNewsList() async {
  var result = <NewsData>[];

  try {
    final url = Uri.parse('https://api.quantz.app/tokensignal/news');
    final response = await http.get(url);
    final obj = jsonDecode(response.body);
    if (obj is List) {
      result = obj.map((json) => NewsData.fromJson(json)).toList();
    }
  } catch (e, trace) {
    if (kDebugMode) {
      print([e, trace]);
    }
  }

  return result;
}
