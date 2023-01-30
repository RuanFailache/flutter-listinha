import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'views/views.dart';
import 'home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<HomePresenter, HomeState>(
        builder: (context, state) {
          return state is HomeSuccessState
              ? FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                )
              : Container();
        },
      ),
      body: SafeArea(
        child: BlocBuilder<HomePresenter, HomeState>(
          builder: (context, state) {
            if (state is HomeInitialState) {
              context.read<HomePresenter>().loadShoppingList();
              return const HomeLoadingView();
            }

            if (state is HomeLoadingState) {
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
