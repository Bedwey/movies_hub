import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'genres_state.dart';

class GenresCubit extends Cubit<GenresState> {
  GenresCubit() : super(GenresInitial());
}
