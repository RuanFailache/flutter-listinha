import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:listinha/features/home/application/bloc/bloc.dart';
import 'package:listinha/features/home/home_screen.dart';

Widget makeHomeApplication(BuildContext context) {
  final homeCubit = HomeCubit();
  return BlocProvider<HomeCubit>(
    create: (context) => homeCubit,
    child: const HomeScreen(),
  );
}
