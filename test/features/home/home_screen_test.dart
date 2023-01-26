import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:listinha/features/home/home.dart';

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

class HomeFakeState extends Fake implements HomeState {}

class HomeUnexpectedState extends HomeState {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockHomeCubit mockHomeCubit;

  setUpAll(() {
    registerFallbackValue(HomeFakeState());
  });

  setUp(() {
    mockHomeCubit = MockHomeCubit();
  });

  Future<void> loadPage(WidgetTester tester) async {
    await tester.pumpWidget(
      BlocProvider<HomeCubit>(
        create: (context) => mockHomeCubit,
        child: const MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );
    await tester.pump();
  }

  testWidgets(
    'Should call HomeCubit.loadShoppingList on HomeInitialState',
    (WidgetTester tester) async {
      when(() => mockHomeCubit.loadShoppingList()).thenAnswer((_) async {});
      when(() => mockHomeCubit.state).thenReturn(HomeInitialState());

      await loadPage(tester);

      verify(() => mockHomeCubit.loadShoppingList()).called(1);
    },
  );

  testWidgets(
    'Should render HomeLoadingView on HomeInitialState',
    (WidgetTester tester) async {
      when(() => mockHomeCubit.loadShoppingList()).thenAnswer((_) async {});
      when(() => mockHomeCubit.state).thenReturn(HomeInitialState());

      await loadPage(tester);

      expect(find.byType(HomeLoadingView), findsOneWidget);
    },
  );

  testWidgets(
    'Should render HomeLoadingView on HomeLoadingState',
    (WidgetTester tester) async {
      when(() => mockHomeCubit.state).thenReturn(HomeLoadingState());

      await loadPage(tester);

      expect(find.byType(HomeLoadingView), findsOneWidget);
    },
  );

  testWidgets(
    'Should render HomePopulatedView on HomeSuccessState if HomeSuccessState.shoppingList is not empty',
    (WidgetTester tester) async {
      when(
        () => mockHomeCubit.state,
      ).thenReturn(
        HomeSuccessState(
          shoppingList: [
            ProductDto(
              id: faker.guid.guid(),
              name: faker.food.cuisine(),
              price: 20.0,
              createdAt: DateTime.now(),
              isAddedToCart: false,
            ),
          ],
        ),
      );

      await loadPage(tester);

      expect(find.byType(HomePopulatedView), findsOneWidget);
    },
  );

  testWidgets(
    'Should render HomeEmptyView on HomeSuccessState if HomeSuccessState.shoppingList is empty',
    (WidgetTester tester) async {
      when(
        () => mockHomeCubit.state,
      ).thenReturn(
        HomeSuccessState(
          shoppingList: [],
        ),
      );

      await loadPage(tester);

      expect(find.byType(HomeEmptyView), findsOneWidget);
    },
  );

  testWidgets(
    'Should render HomeErrorView on HomeErrorState',
    (WidgetTester tester) async {
      when(() => mockHomeCubit.state).thenReturn(HomeErrorState());

      await loadPage(tester);

      expect(find.byType(HomeErrorView), findsOneWidget);
    },
  );

  testWidgets(
    'Should render HomeErrorView on any unexpected state',
    (WidgetTester tester) async {
      when(() => mockHomeCubit.state).thenReturn(HomeUnexpectedState());

      await loadPage(tester);

      expect(find.byType(HomeErrorView), findsOneWidget);
    },
  );
}
