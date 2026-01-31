// ignore_for_file: dead_code

import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:kitchen_sync/models/news/news_model.dart';

import 'package:kitchen_sync/utils/logger.dart';
import 'package:kitchen_sync/utils/result.dart';
import 'package:kitchen_sync/utils/safe_parsing.dart';

List<News> _parseNews(Map<String, dynamic> responseData) {
  final List<dynamic> dynamicData = responseData['data'];

  return SafeParsing.parseList(dynamicData, (json) => News.fromJson(json));
}

class NewsService {
  final Dio _dio;

  NewsService(this._dio);

  Future<Result<List<News>>> getNews() async {
    try {
      Log.d('Getting news from news service');

      return Result.ok([
        News(
          id: 1,
          title: 'Test',
          shortTitle: 'Test',
          slug: 'test',
          createdAt: DateTime.now(),
        ),
        News(
          id: 2,
          title: 'Test 2',
          shortTitle: 'Test 2',
          slug: 'test-2',
          createdAt: DateTime.now(),
        ),
        News(
          id: 3,
          title: 'Test 3',
          shortTitle: 'Test 3',
          slug: 'test-3',
          createdAt: DateTime.now(),
        ),
        News(
          id: 4,
          title: 'Test 4',
          shortTitle: 'Test 4',
          slug: 'test-4',
          createdAt: DateTime.now(),
        ),
        News(
          id: 5,
          title: 'Test 5',
          shortTitle: 'Test 5',
          slug: 'test-5',
          createdAt: DateTime.now(),
        ),
      ]);

      final response = await _dio.get(
        "${dotenv.get('URL_EDITORIAL')}/news?limit=5",
      );

      Log.d('News response: ${response.data}');

      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        final news = await compute(_parseNews, responseData);
        return Result.ok(news);
      } else {
        throw Exception(
          'Failed to load news, status code : ${response.statusCode} : ${response.data['message']}',
        );
      }
    } catch (error) {
      Log.e('Error fetching news: $error');
      return Result.error(
        Exception('An error occurred while fetching news : $error'),
      );
    }
  }
}
