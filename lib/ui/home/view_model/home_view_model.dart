import 'package:flutter/material.dart';

import 'package:kitchen_sync/models/news/news_model.dart';
import 'package:kitchen_sync/repositories/news/news_repository.dart';

import 'package:kitchen_sync/utils/command.dart';
import 'package:kitchen_sync/utils/logger.dart';
import 'package:kitchen_sync/utils/result.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required NewsRepository newsRepository})
    : _newsRepository = newsRepository {
    loadNews = Command0(_loadNews)..execute();
  }

  final NewsRepository _newsRepository;

  late final Command0<List<News>> loadNews;

  bool _isLoadingNews = false;
  bool get isLoadingNews => _isLoadingNews;

  List<News>? _news;
  List<News>? get news => _news;

  Future<Result<List<News>>> _loadNews() async {
    Log.d('Loading news from view model');

    _isLoadingNews = true;
    notifyListeners();

    final result = await _newsRepository.getNews();

    switch (result) {
      case Ok<List<News>>():
        _news = result.value;
      case Error<List<News>>():
        _news = null;
    }

    _isLoadingNews = false;
    notifyListeners();

    return result;
  }
}
