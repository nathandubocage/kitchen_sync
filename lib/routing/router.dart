import 'package:flutter/foundation.dart';

import 'package:kitchen_sync/routing/shell/home_shell.dart';
import 'package:kitchen_sync/routing/shell/account_shell.dart';
import 'package:kitchen_sync/routing/shell/inventory_shell.dart';
import 'package:kitchen_sync/routing/shell/recipes_shell.dart';

import 'package:kitchen_sync/ui/core/screen/core_screen.dart';

import 'package:go_router/go_router.dart';

import 'package:kitchen_sync/routing/routes.dart';
import 'package:kitchen_sync/routing/guard.dart';
import 'package:kitchen_sync/routing/keys.dart';

GoRouter router() {
  return createRouter();
}

GoRouter createRouter() {
  return GoRouter(
    initialLocation: Routes.home,
    debugLogDiagnostics: kDebugMode,
    navigatorKey: rootNavigatorKey,
    redirect: Guard.handleRedirect,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return CoreScreen(navigationShell: navigationShell);
        },
        branches: [
          homeShell(),
          inventoryShell(),
          recipesShell(),
          accountShell(),
        ],
      ),
    ],
  );
}
