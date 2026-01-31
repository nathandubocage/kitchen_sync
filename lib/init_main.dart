import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'package:kitchen_sync/routing/router.dart';
import 'package:kitchen_sync/network/interceptor.dart';
import 'package:kitchen_sync/provider/dependencies.dart';

import 'package:kitchen_sync/main.dart';

import 'package:kitchen_sync/ui/core/utils/error_manager.dart';

Future<void> initializeApp({required String envFileName}) async {
  /* --- Ensure initialization of Flutter --- */
  WidgetsFlutterBinding.ensureInitialized();

  /* --- Load environment variables --- */
  await dotenv.load(fileName: envFileName);

  /* --- Initialize Request Manager and Interceptor with error catching --- */
  final errorManager = ErrorManager();
  final dio = Dio(BaseOptions(responseType: ResponseType.json));

  /* --- Add interceptor to the Dio instance --- */
  dio.interceptors.add(AppInterceptor(errorManager));

  /* --- Initialize Date Formatting for French locale --- */
  initializeDateFormatting('fr_FR', null);

  /* --- Create router instance --- */
  final goRouter = router();

  runApp(
    MultiProvider(
      providers: [
        Provider<GoRouter>.value(value: goRouter),
        Provider<Dio>.value(value: dio),
        ChangeNotifierProvider<ErrorManager>.value(value: errorManager),
        ...providersRemote,
      ],
      child: const MainApp(),
    ),
  );
}
