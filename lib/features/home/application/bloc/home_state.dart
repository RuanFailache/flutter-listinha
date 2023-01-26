import 'package:equatable/equatable.dart';
import 'package:listinha/features/home/domain/dto/dto.dart';

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
