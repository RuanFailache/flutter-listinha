import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';
import 'views/views.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeInitialState || state is HomeLoadingState) {
              return const HomeLoadingView();
            }

            if (state is HomeSuccessState) {
              if (state.shoppingList.isEmpty) {
                return const HomeEmptyView();
              }

              return const HomePopulatedView();
            }

            return const HomeErrorView();
          },
        ),
      ),
    );
  }
}
