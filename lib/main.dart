import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:kitchen_sync/main_local.dart' as local;
// import 'package:kitchen_sync/main_dev.dart' as dev;
// import 'package:kitchen_sync/main_prod.dart' as prod;

import 'package:kitchen_sync/ui/core/themes/theme.dart';
import 'package:kitchen_sync/ui/core/utils/scroll_behavior.dart';

Future<void> main() async {
  await local.main();
  // dev.main();
  // prod.main();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final goRouter = context.read<GoRouter>();

    return MaterialApp.router(
      locale: const Locale('fr', 'FR'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('fr', 'FR'), Locale('en', 'US')],
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppCustomScrollBehavior(),
      title: 'Kitchen Sync',
      routerConfig: goRouter,
      theme: AppTheme.lightTheme,
      showSemanticsDebugger: false,
    );
  }
}
