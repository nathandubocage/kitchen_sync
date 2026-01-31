import 'package:go_router/go_router.dart';

import 'package:kitchen_sync/ui/recipes/screen/recipes_screen.dart';

import 'package:kitchen_sync/routing/routes.dart';
import 'package:kitchen_sync/routing/keys.dart';

StatefulShellBranch recipesShell() {
  return StatefulShellBranch(
    navigatorKey: shellNavigatorKeyRecipes,
    routes: <RouteBase>[
      GoRoute(
        path: Routes.recipes,
        builder: (context, state) {
          return const RecipesScreen();
        },
        routes: [],
      ),
    ],
  );
}
