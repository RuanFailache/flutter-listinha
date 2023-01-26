import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  Future<void> loadShoppingList() async {}
}
