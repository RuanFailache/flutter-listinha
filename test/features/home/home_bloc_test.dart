import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:listinha/core/domain/domain.dart';
import 'package:listinha/features/home/bloc/bloc.dart';

class MockProductRepository extends Mock implements ProductRepository {}

class HomeFakeState extends Fake implements HomeState {}

void main() {
  late HomeCubit sut;
  late MockProductRepository productRepository;

  setUpAll(() {
    registerFallbackValue(HomeFakeState());
  });

  setUp(() {
    productRepository = MockProductRepository();
    sut = HomeCubit(productRepository: productRepository);
  });

  test('Should load with correct initial value', () {
    expect(sut.state, isInstanceOf<HomeInitialState>());
  });

  blocTest<HomeCubit, HomeState>(
    'Should emits correct events on HomeCubit.loadShoppingList when the request is successful',
    build: () => sut,
    act: (bloc) => bloc.loadShoppingList(),
    setUp: () => when(
      () => productRepository.findAll(),
    ).thenAnswer(
      (_) async => [],
    ),
    expect: () => <HomeState>[
      HomeLoadingState(),
      HomeSuccessState(shoppingList: const []),
    ],
    verify: (_) => verify(
      () => productRepository.findAll(),
    ).called(1),
  );

  blocTest<HomeCubit, HomeState>(
    'Should emits correct events on HomeCubit.loadShoppingList when the request fails',
    build: () => sut,
    act: (bloc) => bloc.loadShoppingList(),
    setUp: () => when(
      () => productRepository.findAll(),
    ).thenThrow(
      (_) => Exception(),
    ),
    expect: () => <HomeState>[
      HomeLoadingState(),
      HomeErrorState(),
    ],
    verify: (_) => verify(
      () => productRepository.findAll(),
    ).called(1),
  );
}
