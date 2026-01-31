import 'package:go_router/go_router.dart';

import 'package:kitchen_sync/ui/account/screen/account_screen.dart';

import 'package:kitchen_sync/routing/routes.dart';
import 'package:kitchen_sync/routing/keys.dart';

StatefulShellBranch accountShell() {
  return StatefulShellBranch(
    navigatorKey: shellNavigatorKeyAccount,
    routes: <RouteBase>[
      GoRoute(
        path: Routes.account,
        builder: (context, state) => const AccountScreen(),
        routes: [
          /* --- On peut venir ici pour ajouter des routes enfants --- */
        ],
      ),
    ],
  );
}
