import 'package:equatable/equatable.dart';
import 'package:listinha/core/domain/domain.dart';

abstract class HomeState extends Equatable {
  @override
  List get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<ProductDto> shoppingList;

  HomeSuccessState({required this.shoppingList});
}
