import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:listinha/features/home/presentation/bloc/bloc.dart';
import 'package:listinha/features/home/presentation/home_screen.dart';

Widget makeHomePresentation(BuildContext context) {
  final homeCubit = HomeCubit();
  return BlocProvider<HomeCubit>(
    create: (context) => homeCubit,
    child: const HomeScreen(),
  );
}
