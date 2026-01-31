import 'package:go_router/go_router.dart';

import 'package:kitchen_sync/ui/inventory/screen/inventory_screen.dart';

import 'package:kitchen_sync/routing/routes.dart';
import 'package:kitchen_sync/routing/keys.dart';

StatefulShellBranch inventoryShell() {
  return StatefulShellBranch(
    navigatorKey: shellNavigatorKeyInventory,
    routes: <RouteBase>[
      GoRoute(
        path: Routes.inventory,
        builder: (context, state) {
          return InventoryScreen();
        },
        routes: [],
      ),
    ],
  );
}
