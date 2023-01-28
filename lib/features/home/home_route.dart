import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:listinha/app/app.dart';
import 'package:listinha/core/data/data.dart';

import 'bloc/bloc.dart';
import 'home.dart';

class HomeRoute extends AppRoute {
  @override
  String get path => '/';

  @override
  Widget screen(BuildContext context) {
    final productRepository = RemoteProductRepository();
    final homeCubit = HomeCubit(productRepository: productRepository);
    return BlocProvider<HomeCubit>(
      create: (context) => homeCubit,
      child: const HomeScreen(),
    );
  }
}
