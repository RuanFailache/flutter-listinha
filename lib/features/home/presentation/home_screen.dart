import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';
import 'widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeInitialState) {
            return const HomeEmptyView();
          }

          if (state is HomeLoadingState) {
            return const HomeLoadingView();
          }

          throw UnimplementedError();
        },
      ),
    );
  }
}
