import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:listinha/features/home/presentation/bloc/bloc.dart';
import 'package:listinha/features/home/presentation/views/views.dart';
import 'package:listinha/features/home/presentation/home_screen.dart';

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

class HomeFakeState extends Fake implements HomeState {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockHomeCubit mockHomeCubit;

  setUpAll(() {
    registerFallbackValue(HomeFakeState());
  });

  setUp(() {
    mockHomeCubit = MockHomeCubit();
  });

  testWidgets(
    'Should render HomeEmptyView on HomeInitialState',
    (WidgetTester tester) async {
      when(() => mockHomeCubit.state).thenReturn(HomeInitialState());

      await tester.pumpWidget(
        BlocProvider<HomeCubit>(
          create: (context) => mockHomeCubit,
          child: const MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(HomeEmptyView), findsOneWidget);
    },
  );

  testWidgets(
    'Should render HomeLoadingView on HomeLoadingState',
    (WidgetTester tester) async {
      when(() => mockHomeCubit.state).thenReturn(HomeLoadingState());

      await tester.pumpWidget(
        BlocProvider<HomeCubit>(
          create: (context) => mockHomeCubit,
          child: const MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(HomeLoadingView), findsOneWidget);
    },
  );

  testWidgets(
    'Should render HomeSuccessView on HomeSuccessState',
    (WidgetTester tester) async {
      when(() => mockHomeCubit.state).thenReturn(HomeSuccessState());

      await tester.pumpWidget(
        BlocProvider<HomeCubit>(
          create: (context) => mockHomeCubit,
          child: const MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(HomeSuccessView), findsOneWidget);
    },
  );
}
