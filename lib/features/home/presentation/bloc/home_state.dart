enum HomeStatus {
  initial,
  loading,
  success,
  error,
}

class HomeState {
  final HomeStatus status;

  HomeState({
    required this.status,
  });

  static HomeState get initialState {
    return HomeState(
      status: HomeStatus.initial,
    );
  }

  HomeState copyWith({
    HomeStatus? status,
  }) {
    return HomeState(
      status: status ?? this.status,
    );
  }
}
