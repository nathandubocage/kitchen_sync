import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:go_router/go_router.dart';

Page<void> checkTransitionPage(Widget child, GoRouterState state) {
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    return CupertinoPage(key: state.pageKey, child: child);
  } else {
    return MaterialPage(key: state.pageKey, child: child);
  }
}

Page<void> noTransitionPage(Widget child, GoRouterState state) {
  return NoTransitionPage(key: state.pageKey, child: child);
}
