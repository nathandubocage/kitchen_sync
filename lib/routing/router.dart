import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:kitchen_sync/routing/shell/home_shell.dart';
import 'package:kitchen_sync/routing/shell/account_shell.dart';
import 'package:kitchen_sync/routing/shell/inventory_shell.dart';
import 'package:kitchen_sync/routing/shell/recipes_shell.dart';

import 'package:kitchen_sync/ui/scan/screen/scan_screen.dart';
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
      GoRoute(
        parentNavigatorKey: rootNavigatorKey, // Important
        path: Routes.scan,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const ScanScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.easeOutQuart;

                  var tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
          );
        },
      ),
    ],
  );
}
