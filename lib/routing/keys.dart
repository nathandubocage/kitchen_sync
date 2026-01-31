import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> shellNavigatorKeyHome =
    GlobalKey<NavigatorState>(debugLabel: 'shellBranchHome');
final GlobalKey<NavigatorState> shellNavigatorKeyInventory =
    GlobalKey<NavigatorState>(debugLabel: 'shellBranchInventory');
final GlobalKey<NavigatorState> shellNavigatorKeyRecipes =
    GlobalKey<NavigatorState>(debugLabel: 'shellBranchRecipes');
final GlobalKey<NavigatorState> shellNavigatorKeyAccount =
    GlobalKey<NavigatorState>(debugLabel: 'shellBranchAccount');
