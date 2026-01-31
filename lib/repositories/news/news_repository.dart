import 'package:kitchen_sync/services/news_service.dart';

import 'package:kitchen_sync/models/news/news_model.dart';

import 'package:kitchen_sync/utils/logger.dart';
import 'package:kitchen_sync/utils/result.dart';

class NewsRepository {
  NewsRepository({required NewsService newsService})
    : _newsService = newsService;

  final NewsService _newsService;

  List<News>? _news;

  Future<Result<List<News>>> getNews({bool forceRefresh = false}) async {
    try {
      if (_news != null && !forceRefresh) {
        return Result.ok(_news!);
      }

      Log.d('Getting news from news repository');

      final newsResult = await _newsService.getNews();

      switch (newsResult) {
        case Ok<List<News>>():
          _news = newsResult.value;
        case Error<List<News>>():
          _news = null;
      }

      return newsResult;
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
