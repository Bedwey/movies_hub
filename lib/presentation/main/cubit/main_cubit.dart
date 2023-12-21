import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());

  void changeIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}

class MainState extends Equatable {
  const MainState({
    this.currentIndex = 0,
  });

  final int currentIndex;

  @override
  List<Object> get props => [currentIndex];

  MainState copyWith({int? currentIndex}) {
    return MainState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
