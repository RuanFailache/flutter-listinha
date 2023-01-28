import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:listinha/core/domain/domain.dart';

import 'bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductRepository productRepository;

  HomeCubit({
    required this.productRepository,
  }) : super(HomeInitialState());

  Future<void> loadShoppingList() async {
    emit(HomeLoadingState());
    try {
      final shoppingList = await productRepository.findAll();
      emit(HomeSuccessState(shoppingList: shoppingList));
    } catch (err) {
      emit(HomeErrorState());
    }
  }
}
