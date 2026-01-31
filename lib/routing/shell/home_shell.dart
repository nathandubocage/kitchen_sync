import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'package:kitchen_sync/ui/home/screen/home_screen.dart';
import 'package:kitchen_sync/ui/home/view_model/home_view_model.dart';
import 'package:kitchen_sync/repositories/news/news_repository.dart';

import 'package:kitchen_sync/routing/routes.dart';
import 'package:kitchen_sync/routing/keys.dart';

StatefulShellBranch homeShell() {
  return StatefulShellBranch(
    navigatorKey: shellNavigatorKeyHome,
    routes: <RouteBase>[
      GoRoute(
        path: Routes.home,
        builder: (context, state) {
          /* --- Ici on a décidé de créer le ViewModel. Cependant il sera ré-instancié à chaque fois que l'utilisateur naviguera sur cette branche et ces enfants. --- */
          return HomeScreen(
            homeViewModel: HomeViewModel(
              newsRepository: context.read<NewsRepository>(),
            ),
          );

          /* --- Un autre pattern vise à créer le ViewModel une seule fois (en déclarant en Provider ou ChangeNotifierProvider) et de l'injecter dans la branche. --- */
          /* --- Voir provider/dependencies.dart pour l'exemple. --- */
          // return HomeScreen(
          //   homeViewModel: context.read<HomeViewModel>(),
          // );
        },
        routes: [
          /* --- On peut venir ici pour ajouter des routes enfants --- */
        ],
      ),
    ],
  );
}
