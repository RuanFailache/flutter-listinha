import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:listinha/app/app.dart';
import 'package:listinha/core/data/data.dart';

import 'home.dart';

class HomeRoute extends AppRoute {
  @override
  String get path => '/';

  @override
  Widget screen(BuildContext context) {
    final productRepository = RemoteProductRepository();
    final homePresenter = HomePresenter(productRepository: productRepository);
    return BlocProvider<HomePresenter>(
      create: (context) => homePresenter,
      child: const HomeScreen(),
    );
  }
}
