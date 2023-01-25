import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listinha/features/home/presentation/home_screen.dart';
import 'package:listinha/features/home/presentation/widgets/widgets.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:listinha/features/home/presentation/bloc/bloc.dart';

import 'home_screen_test.mocks.dart';

@GenerateMocks([HomeBloc])
void main() {
  late MockHomeBloc bloc;

  setUp(() {
    bloc = MockHomeBloc();
  });

  group(
    'HomeScreen behavior in all HomeStatus',
    () {
      testWidgets(
        'Should render HomeEmptyView when HomeStatus.initial',
        (WidgetTester tester) async {
          when(bloc.state).thenReturn(HomeState.initialState);

          await tester.pumpWidget(
            MaterialApp(
              home: BlocProvider(
                create: (context) => bloc,
                child: const HomeScreen(),
              ),
            ),
          );

          expect(find.byType(HomeEmptyView), findsOneWidget);
        },
      );

      testWidgets(
        'Should render HomeLoadingView when HomeStatus.loading',
        (WidgetTester tester) async {},
      );

      testWidgets(
        'Should render HomePopulatedView when HomeStatus.success',
        (WidgetTester tester) async {},
      );

      testWidgets(
        'Should render HomeEmptyView when HomeStatus.success and ShoppingList is empty',
        (WidgetTester tester) async {},
      );

      testWidgets(
        'Should render HomeErrorView when HomeStatus.error',
        (WidgetTester tester) async {},
      );
    },
  );
}
