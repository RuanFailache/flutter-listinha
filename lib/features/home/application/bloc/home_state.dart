import 'package:listinha/features/home/domain/dto/dto.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<ProductDto> shoppingList;

  HomeSuccessState({required this.shoppingList});
}
