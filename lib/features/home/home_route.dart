import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listinha/app/app_routes.dart';

import 'package:listinha/features/home/application/bloc/bloc.dart';
import 'package:listinha/features/home/data/data.dart';
import 'package:listinha/features/home/home_screen.dart';

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
