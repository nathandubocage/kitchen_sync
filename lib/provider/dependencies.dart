import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:kitchen_sync/repositories/news/news_repository.dart';
import 'package:kitchen_sync/services/news_service.dart';

List<SingleChildWidget> get providersRemote {
  return [
    Provider<NewsService>(
      create: (context) => NewsService(context.read<Dio>()),
    ),
    Provider<NewsRepository>(
      create: (context) =>
          NewsRepository(newsService: context.read<NewsService>()),
    ),

    /* --- Exemple du home_shell.dart --- */
    // ChangeNotifierProvider(
    //   create: (context) => HomeViewModel(
    //     newsRepository: context.read<NewsRepository>(),
    //   ),
    // ),
  ];
}
