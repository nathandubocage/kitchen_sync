import 'package:flutter/material.dart';
import 'package:kitchen_sync/ui/core/widgets/header_widget.dart';

import 'package:kitchen_sync/ui/home/view_model/home_view_model.dart';
import 'package:kitchen_sync/utils/widget_extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required HomeViewModel homeViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget().withPadding(EdgeInsets.symmetric(horizontal: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
