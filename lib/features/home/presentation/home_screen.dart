import 'package:flutter/material.dart';
import 'package:listinha/features/home/presentation/widgets/home_empty_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeEmptyView(),
    );
  }
}
