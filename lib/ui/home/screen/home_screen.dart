import 'package:flutter/material.dart';

import 'package:kitchen_sync/ui/home/view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required HomeViewModel homeViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Home')));
  }
}
