import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());
}
