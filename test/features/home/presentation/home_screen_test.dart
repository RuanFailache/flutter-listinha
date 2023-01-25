import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'HomeScreen behavior in all HomeStatus',
    () {
      testWidgets(
        'Should render HomeEmptyView when HomeStatus.initial',
        (WidgetTester tester) async {},
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
