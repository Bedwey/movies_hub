import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(const AuthenticationState()) {
    initStream();
  }

  StreamSubscription? streamSubscription;

  void initStream() async {
    streamSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((AuthState authState) {
      emit(state.copyWith(status: authState.session != null ? AuthenticationStatus.authenticated : AuthenticationStatus.unauthenticated));
    });
  }
}
