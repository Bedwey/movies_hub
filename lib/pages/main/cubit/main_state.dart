part of 'main_cubit.dart';

final class MainState extends Equatable {
  const MainState({
    this.pageIndex = 0,
  });

  final int pageIndex;

  @override
  List<Object> get props => [pageIndex];

  MainState copyWith({int? pageIndex}) {
    return MainState(
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
}
