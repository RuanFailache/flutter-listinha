import 'package:flutter/material.dart';

class HomeEmptyView extends StatelessWidget {
  const HomeEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Nenhum item adicionado à lista'),
    );
  }
}
