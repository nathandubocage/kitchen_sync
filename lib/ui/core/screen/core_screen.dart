import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:solar_icon_pack/solar_bold_icons.dart';

import 'package:kitchen_sync/routing/routes.dart';

import 'package:kitchen_sync/models/core/navigation_item.dart';

import 'package:kitchen_sync/ui/core/utils/error_manager.dart';
import 'package:kitchen_sync/ui/core/themes/colors.dart';

class CoreScreen extends StatefulWidget {
  const CoreScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<CoreScreen> createState() => _CoreScreenState();
}

class _CoreScreenState extends State<CoreScreen> {
  late ErrorManager errorManager;

  final List<NavigationItem> navigationItems = [
    NavigationItem(
      initialRoute: Routes.home,
      label: 'Accueil',
      icon: const Icon(SolarBoldIcons.widget),
    ),
    NavigationItem(
      initialRoute: Routes.inventory,
      label: 'Inventaire',
      icon: const Icon(SolarBoldIcons.sort),
    ),
    NavigationItem(
      initialRoute: Routes.recipes,
      label: 'Recettes',
      icon: const Icon(SolarBoldIcons.chefHet),
    ),
    NavigationItem(
      initialRoute: Routes.account,
      label: 'Compte',
      icon: const Icon(SolarBoldIcons.userCircle),
    ),
  ];

  @override
  void initState() {
    super.initState();

    errorManager = Provider.of<ErrorManager>(context, listen: false);
    errorManager.addListener(_handleError);
  }

  void _onTap(BuildContext context, int index) {
    if (index == widget.navigationShell.currentIndex) {
      widget.navigationShell.goBranch(index, initialLocation: true);
      return;
    }

    widget.navigationShell.goBranch(index, initialLocation: false);
  }

  void _handleError() {
    final currentError = errorManager.currentError;

    if (currentError != null && currentError.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            currentError,
            style: GoogleFonts.roboto(color: AppColors.white, fontSize: 13),
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          duration: const Duration(seconds: 3),
          dismissDirection: DismissDirection.horizontal,
        ),
      );
      errorManager.clear();
    }
  }

  @override
  void dispose() {
    errorManager.removeListener(_handleError);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      floatingActionButton: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.3),
              blurRadius: 6,
              spreadRadius: -4,
              offset: const Offset(0, 4),
            ),
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.3),
              blurRadius: 15,
              spreadRadius: -3,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () => context.push(Routes.scan),
          backgroundColor: AppColors.primary,
          elevation: 0,
          shape: const CircleBorder(),
          child: const Icon(
            SolarBoldIcons.scanner,
            color: AppColors.white,
            size: 28,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.catskillWhite.withValues(alpha: 0.5),
            ),
          ),
        ),
        child: NavigationBar(
          selectedIndex: widget.navigationShell.currentIndex,
          onDestinationSelected: (index) => _onTap(context, index),
          destinations: navigationItems.map((item) {
            return NavigationDestination(
              icon: item.icon,
              selectedIcon: item.selectedIcon,
              label: item.label,
            );
          }).toList(),
        ),
      ),
    );
  }
}
